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

