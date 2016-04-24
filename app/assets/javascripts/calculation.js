$(document).ready(function(){

    $(".btn").click(function(ev){
        ev.preventDefault();
        var state            = $("#state").val();
        var zipcode          = 80220;
        var userKwh          = 6000;
        var roofAngle        = $("#roof-angle").val();
        var azimuthAngle     = $("#azimuth-angle").val();
        var systemCapacity   = $("#system").val();
        var upfrontCost      = totalSystemCost();
        var annualElecCost   = annualElecCost();
        acAnnual();
        //var PayOff           = calculateYearsToPayoff(annualElecCost, upfrontCost)




        function  acAnnual() {
            $.getJSON("https://developer.nrel.gov/api/pvwatts/v5.json?api_key=JTA78ioyrPZ2AEfxYmqa4UttsokMGxXgXI48L6rF&address="
                      + zipcode
                      + "&tilt=" + roofAngle
                      + "&azimuth=" + azimuthAngle
                      + "&system_capacity=" + systemCapacity
                      + "&array_type=1&module_type=1&losses=15",
                      function(response){
                          var annualAcOutput = response.outputs.ac_annual
                          var percentageOffset = calculatePercentageOffset(annualAcOutput)
                          renderText(percentageOffset)
                          //$('.right-card').append('<div class=percentage-offset><h5>' + total + '</h5></div>')
                      })
        }

        function totalSystemCost() {
            $.getJSON("http://localhost:3000/api/v1/install_summary/" + state + ".json",
                      function(response){
                          var avgCostPw = response[state]['price_per_watt']
                          var total = calculateTotalSystemCost(avgCostPw)
                          renderText(total)
                          //$('.right-card').append('<div class=system-cost><h5>' + total + '</h5></div>')
                      })
        }

        function annualElecCost() {
            $.getJSON("http://api.eia.gov/series/?api_key=EC28B206A1F13B7ABC5601F247D40844&series_id=ELEC.PRICE."
                      + state + "-RES.A",
                      function(response){
                          var avgElecCost = response['series'][0]['data'][0][1]
                          calculateAnnualCost(avgElecCost)
                      })
        }

        function calculateTotalSystemCost(avgCostPw) {
            var num = (avgCostPw * systemCapacity)
            var toDollars = num.toLocaleString()
            return "Your total upfront cost would be " + "$" + toDollars
        }

        function calculateAnnualCost(avgElecCost) {
            return 'annual electricity costs: ' + (userKwh * (avgElecCost / 100))
        }

        function calculateYearsToPayoff(i, u) {
            var count = 0
            var total = 0
            var apr   = 1.045
            while (total < u){
                total += i * Math.pow((apr), count)
                count += 1
                count++
            }
            renderText(count)
        }

        function calculatePercentageOffset(pvOutput) {
            var num = Math.round((pvOutput / userKwh) * 100)
            return "Your percentage offset would be " + "%" + num
        }

        function renderText(text){
            $(".right-card")
            .append("<div class=text><h5>"
                    + text
                    + "</h5></div>"
                   );
        }
    });
});
