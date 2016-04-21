 var usaMap = new Datamap({
            scope: 'usa',
            element: document.getElementById('us_map'),
            geographyConfig: {
              highlightBorderColor: '#2176C7',
              popupTemplate: function(geo, data) {
                  return "<div class='hoverinfo'><strong>" +  geo.properties.name + '<br>' + ' Total Solar Installs: ' +  data.installs +  "</strong></div>";
              },
              highlightOnHover: true,
              borderColor: '#444',
              borderWidth: 0.5
            },
            dataUrl: 'http://localhost:3000/api/v1/install_summary.json',
            data: {},
            fills: {
              'highest': '#BD3613',
              'mid-highest': '#A57706',
              'mid-lowest': '#EAE3CB',
              'lowest': '#FCF4DC',
              defaultFill: '#dddddd'
            }
          });
