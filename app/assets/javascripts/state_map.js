 var usaMap = new Datamap({
            scope: 'usa',
            element: document.getElementById('us_map'),
            geographyConfig: {
              highlightBorderColor: '#bada55',
              popupTemplate: function(geo, data) {
                  return "<div class='hoverinfo'><strong>" +  geo.properties.name + '<br>' + ' Total Solar Installs:' +  data.installs +  "</strong></div>";
              },
              highlightOnHover: true,
              borderColor: '#444',
              borderWidth: 0.5
            },
            dataUrl: 'http://localhost:3000/api/v1/install_summary.json',
            data: {},
            fills: {
              'highest': '#306596',
              'mid-highest': '#0fa0fa',
              'mid-lowest': '#bada55',
              'lowest': '#bada55',
              defaultFill: '#dddddd'
            }
          });
