function calculatePayoffWithTaxCredit(i, u) {
    var afterTaxCredit = (u - Math.round(u * 0.3))
    var count = 0
    var total = 0
    var apr   = 1.04
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

function calculateYearsToPayoff(acCost, systemCost, percentageOffset) {
  //console.log('this is percentage -' + percentageOffset)
  console.log('this is annual cost - ' + acCost)
  //console.log('this is system cost -' + systemCost)
  var count = 0
  var total = 0
  var apr   = 1.04
  while (total < systemCost){
    total += acCost * Math.pow((apr), count)
    console.log('this is total ' + total)
    count++
  }
  renderPayoff(count)
  calculatePayoffWithTaxCredit(acCost, systemCost)
}

function calculateAnnualCost(userKwh, avgElecCost, systemCost, percentageOffset) {
  var acCostBasedOnSystemSize = ((userKwh * (percentageOffset / 100)) * (avgElecCost / 100))
  //var acTotal = userKwh * (avgElecCost / 100)
  calculateYearsToPayoff(acCostBasedOnSystemSize, systemCost, percentageOffset)
  //calculateYearsToPayoff(acTotal, systemCost, percentageOffset)
}

function calculateTotalSystemCost(userKwh, avgCostPw, systemCapacity, state, percentageOffset) {
  var systemCost = (avgCostPw * systemCapacity)
  var toDollars = systemCost.toLocaleString()
  annualElecCost(userKwh, state, systemCost, percentageOffset)
  return toDollars
}
