$(document).ready(function(){
$('#right-card').hide()
$('#calculator-help-card').show()

    $(".btn").click(function(ev){
        ev.preventDefault();
        $('#calculator-help-card').hide()
        $('.fade-results').fadeOut('slow', 0)
        $('#right-card').fadeIn('slow', 0)
        var state            = $("#state").val();
        var zipcode          = $("#zip").val();
        var userKwh          = $("#kwh").val();
        var roofAngle        = $("#roof-angle").val();
        var azimuthAngle     = $("#azimuth-angle").val();
        var systemCapacity   = $("#system").val();
        var annualCost = acAnnual(zipcode, roofAngle, azimuthAngle, systemCapacity, userKwh, state)
        $('.fade-results').fadeIn('slow', 0)
        debugger
    });
});

function acAnnual(zipcode, roofAngle, azimuthAngle, systemCapacity, userKwh, state) {
  $.ajax({
    url: "https://developer.nrel.gov/api/pvwatts/v5.json?api_key=JTA78ioyrPZ2AEfxYmqa4UttsokMGxXgXI48L6rF&address="
    + zipcode
    + "&tilt=" + roofAngle
    + "&azimuth=" + azimuthAngle
    + "&system_capacity=" + systemCapacity
    + "&array_type=1&module_type=1&losses=15",
    dataType: 'json',
    type: 'GET',
    success: function(response){
      var annualAcOutput = response.outputs.ac_annual
      var percentageOffset = calculatePercentageOffset(annualAcOutput, userKwh)
      renderOffset(percentageOffset)
      formatOutput(annualAcOutput)
      totalSystemCost(userKwh, state, systemCapacity)
      debugger
    }.bind(this)
  });
}

function totalSystemCost(userKwh, state, systemCapacity) {
  $.getJSON("/api/v1/install_summary/" + state + ".json",
            function(response){
              var avgCostPw = response[state]['price_per_watt']
              var totalSystemCost = calculateTotalSystemCost(userKwh, avgCostPw, systemCapacity, state)
              renderSystemCost(totalSystemCost)
              debugger
            })
}

function calculateTotalSystemCost(userKwh, avgCostPw, systemCapacity, state) {
  var systemCost = (avgCostPw * systemCapacity)
  var toDollars = systemCost.toLocaleString()
  annualElecCost(userKwh, state, systemCost)
  return toDollars
  debugger
}

function annualElecCost(userKwh, state, systemCost) {
  $.getJSON("http://api.eia.gov/series/?api_key=EC28B206A1F13B7ABC5601F247D40844&series_id=ELEC.PRICE."
            + state + "-RES.A",
            function(response){
              var avgElecCost = response['series'][0]['data'][0][1]
              calculateAnnualCost(userKwh, avgElecCost, systemCost)
              debugger
            })
}

function calculateAnnualCost(userKwh, avgElecCost, systemCost) {
  var annualCost = (userKwh * (avgElecCost / 100))
  calculateYearsToPayoff(annualCost, systemCost)
  return 'annual electricity costs: ' + annualCost
}

function calculateYearsToPayoff(i, u) {
  var count = 0
  var total = 0
  var apr   = 1.045
  while (total < u){
    total += i * Math.pow((apr), count)
    count++
        debugger
  }
  renderPayoff(count)
  calculatePayoffWithTaxCredit(i, u)
}

function calculatePayoffWithTaxCredit(i, u) {
    var afterTaxCredit = (u - Math.round(u * 0.3))
    var count = 0
    var total = 0
    var apr   = 1.045
    while (total < afterTaxCredit) {
        total += i * Math.pow((apr), count)
        count++
    }
    renderPayoffWithTaxCredit(count)
}

function calculatePerYearCosts(i, u) {
  var count = 0
  var total = 0
  var apr   = 1.045
  while (total < 25){
    total += i * Math.pow((apr), count)
    count++
  }
}

function calculatePercentageOffset(pvOutput, userKwh) {
  var num = Math.round((pvOutput / userKwh) * 100)
  return num
}

function formatOutput(output){
  var roundOutput = Math.round(output)
  var outputText = roundOutput
  renderPvOutput(outputText)
}

function renderPayoff(text){
  $("#payoff-text")
  .text(text + " years");
}

function renderPayoffWithTaxCredit(text){
  $("#tax-credit-text")
  .text(text + " years");
}

function renderSystemCost(text){
  $("#upfront-cost-text")
  .text("$" + text);
}

function renderOffset(text){
  $("#percentage-text")
  .text(text + '%');
}

function renderPvOutput(text){
  $("#pv-text")
  .text(text + " kilowatt hours");
}
