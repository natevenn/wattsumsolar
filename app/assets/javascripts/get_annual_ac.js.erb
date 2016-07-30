function acAnnual(zipcode, roofAngle, azimuthAngle, systemCapacity, userKwh, state) {
  $.ajax({
    url: "https://developer.nrel.gov/api/pvwatts/v5.json?api_key=<%= ENV['NREL_API_KEY'] %>&address="
    + zipcode
    + "&tilt=" + roofAngle
    + "&azimuth=" + azimuthAngle
    + "&system_capacity=" + systemCapacity
    + "&array_type=1&module_type=1&losses=15",
    dataType: 'json',
    type: 'GET',
    success: function(response){
      var annualAcOutput = response.outputs.ac_annual
      var monthlyAcOutput = response.outputs.ac_monthly
      var percentageOffset = calculatePercentageOffset(annualAcOutput, userKwh)
      var bardata = $.map(monthlyAcOutput, function(month) {
        month = (Math.round(month));
        return month
      });
      chartMonthlyOutput(bardata)
      renderOffset(percentageOffset)
      formatOutput(annualAcOutput)
      totalSystemCost(userKwh, state, systemCapacity)
    }.bind(this)
  });
}
