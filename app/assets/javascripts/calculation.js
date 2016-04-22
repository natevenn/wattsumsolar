$(".btn").click(function(ev){
    ev.preventDefault();
    var zipcode      = $("#zip").val();
    console.log(zipcode);
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
              $.getJSON("https://developer.nrel.gov/api/solar/open_pv/installs/summaries?api_key=JTA78ioyrPZ2AEfxYmqa4UttsokMGxXgXI48L6rF&address="
                        + zipcode,
                        function(response){
                            var avg_cost = response.result.avg_cost_pw
                            console.log(avg_cost)
                        });
});
