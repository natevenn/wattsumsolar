$(".btn").click(function(ev){
    ev.preventDefault();
    var state        = $("#state").val();
    console.log(state)
    var zipcode      = $("#zip").val();
    console.log(zipcode);
    var userKwh      = $("#kwh").val();
    console.log(userKwh)
    var roofAngle    = $("#roof-angle").val();
    console.log(roofAngle);
    var azimuthAngle = $("#azimuth-angle").val();
    console.log(azimuthAngle);
    var systemCapacity   = $("#system").val();
    console.log(systemCapacity);
    $.getJSON("https://developer.nrel.gov/api/pvwatts/v5.json?api_key=JTA78ioyrPZ2AEfxYmqa4UttsokMGxXgXI48L6rF&address="
              + zipcode
              + "&tilt=" + roofAngle
              + "&azimuth=" + azimuthAngle
              + "&system_capacity=" + systemCapacity
              + "&array_type=1&module_type=1&losses=15",
              function(response){
                  var ac_annual = response.outputs.ac_annual
                  console.log(ac_annual)
              });
    $.getJSON("http://api.eia.gov/series/?api_key=EC28B206A1F13B7ABC5601F247D40844&series_id=ELEC.PRICE."
              + state + "-RES.A",
              function(response){
                  var avgElecCost = response['series'][0]['data'][0][1]
                  console.log(avgElecCost)
              })
});

