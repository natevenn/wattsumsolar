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

function calculateYearsToPayoff(annualCost, systemCost, percentageOffset) {
  console.log('this is percentage -' + percentageOffset)
  console.log('this is annual cost -' + annualCost)
  console.log('this is system cost -' + systemCost)
  var count = 0
  var total = 0
  var apr   = 1.045
  while (total < systemCost){
    total += annualCost * Math.pow((apr), count)
    count++
  }
  renderPayoff(count)
  calculatePayoffWithTaxCredit(annualCost, systemCost)
}

function calculateAnnualCost(userKwh, avgElecCost, systemCost, percentageOffset) {
  var annualCost = (userKwh * (avgElecCost / 100))
  calculateYearsToPayoff(annualCost, systemCost, percentageOffset)
  return 'annual electricity costs: ' + annualCost
}

function calculateTotalSystemCost(userKwh, avgCostPw, systemCapacity, state, percentageOffset) {
  var systemCost = (avgCostPw * systemCapacity)
  var toDollars = systemCost.toLocaleString()
  annualElecCost(userKwh, state, systemCost, percentageOffset)
  return toDollars
}
