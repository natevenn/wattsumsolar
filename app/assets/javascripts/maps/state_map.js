 var usaMap = new Datamap({
            scope: 'usa',
            element: document.getElementById('us_map'),
            geographyConfig: {
              highlightBorderColor: '#2176C7',
              popupTemplate: function(geo, data) {
                  return "<div class='hoverinfo'>" +  geo.properties.name + '<br>' + ' Solar Installs: ' +  formatNumber(data.installs) + "</div>";
              },
              highlightOnHover: true,
              borderColor: '#444',
              borderWidth: 0.5
            },
            dataUrl: window.location.pathname + 'api/v1/install_summary.json',
            data: {},
            fills: {
              'highest': '#FF6D00',
              'mid_highest': '#ff9100',
              'mid_lowest': '#FFAB40',
              'lowest': '#FFD180',
            }
          });

function formatNumber(num){
    return num.toLocaleString()
}
//function formatPrice(num) {
  //var v = num/Math.pow(10, 3);
  //var l = Math.round(v, -2);
    //return "$" + l
//}

