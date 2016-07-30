function totalSystemCost(userKwh, state, systemCapacity) {
  $.getJSON("/api/v1/install_summary/" + state + ".json",
            function(response){
              var avgCostPw = response[state]['price_per_watt']
              var totalSystemCost = calculateTotalSystemCost(userKwh, avgCostPw, systemCapacity, state)
              renderSystemCost(totalSystemCost)
            })
}
