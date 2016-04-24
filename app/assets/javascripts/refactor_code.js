//$(".btn").click(function(ev){
    //ev.preventDefault();
    //var state        = $("#state").val();
    //var zipcode      = $("#zip").val();
    //var userKwh      = $("#kwh").val();
    //var roofAngle    = $("#roof-angle").val();
    //var azimuthAngle = $("#azimuth-angle").val();
    //var systemCapacity   = $("#system").val();
    //totalOutput()
    ////totalOutput.done(totalSystemCost).done(annualCost)
//});

    //function totalOutput(){
        //$.getJSON("https://developer.nrel.gov/api/pvwatts/v5.json?api_key=JTA78ioyrPZ2AEfxYmqa4UttsokMGxXgXI48L6rF&address="
                  //+ zipcode
                  //+ "&tilt=" + roofAngle
                  //+ "&azimuth=" + azimuthAngle
                  //+ "&system_capacity=" + systemCapacity
                  //+ "&array_type=1&module_type=1&losses=15",
                  //function(response){
                      //debugger
                      //var ac_annual = response.outputs.ac_annual
                      //console.log(ac_annual)
                  //})
    //}

    //function totalSystemCost() {
        //$.getJSON("http://localhost:3000/api/v1/install_summary/" + state + ".json",
                  //function(response){
                      //var avgCostPw = response[state]['price_per_watt']
                      //console.log(avgCostPw)
                      //calculateTotalSystemCost(avgCostPw);
                  //})
    //}

    //function annualCost() {
        //$.getJSON("http://api.eia.gov/series/?api_key=EC28B206A1F13B7ABC5601F247D40844&series_id=ELEC.PRICE."
                  //+ state + "-RES.A",
                  //function(response){
                      //var avgElecCost = response['series'][0]['data'][0][1]
                      //console.log(avgElecCost)
                     //calculateAnnualCost(avgElecCost);
                  //})
    //}

  //function calculateTotalSystemCost(avgCostPw) {
      //( "Total upfront cost:" + (systemCapacity * avgCostPw) )
  //}

  //function calculateAnnualCost(avgElecCost) {
     //( 'annual electricity costs:' + (userKwh * (avgElecCost / 100)) )
  //}

  //function calculatYearToPayoff(i, u) {
      //var count = 0
      //var total = 0
      //var apr   = 1.045
      //while (total < u){
          //total += i * Math.pow((apr), count)
          //debugger
      //count += 1
      //count++
      //}
      //console.log(count)
  //}
