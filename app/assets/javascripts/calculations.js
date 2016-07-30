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

function calculatePercentageOffset(pvOutput, userKwh) {
  var num = Math.round((pvOutput / userKwh) * 100)
  return num
}

function calculateYearsToPayoff(i, u) {
  var count = 0
  var total = 0
  var apr   = 1.045
  while (total < u){
    total += i * Math.pow((apr), count)
    count++
  }
  renderPayoff(count)
  calculatePayoffWithTaxCredit(i, u)
}

function calculateAnnualCost(userKwh, avgElecCost, systemCost) {
  var annualCost = (userKwh * (avgElecCost / 100))
  calculateYearsToPayoff(annualCost, systemCost)
  return 'annual electricity costs: ' + annualCost
}

function calculateTotalSystemCost(userKwh, avgCostPw, systemCapacity, state) {
  var systemCost = (avgCostPw * systemCapacity)
  var toDollars = systemCost.toLocaleString()
  annualElecCost(userKwh, state, systemCost)
  return toDollars
}
