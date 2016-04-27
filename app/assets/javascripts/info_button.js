$(document).ready(function(){
        //$('#kwh-help-card').hide();

    $("#info_kwh").on('click', function() {
        $('#kwh-help-card').show();
        $('#calculator-help-card').hide();
    })

    $("#info_roof").on('click', function() {
        $('#roof-help-card').show();
        $('#calculator-help-card').hide();
    })

    $("#info_azimuth").on('click', function() {
        $('#azimuth-help-card').show();
        $('#calculator-help-card').hide();
    })

    $("#info_system").on('click', function() {
        $('#system-help-card').show();
        $('#calculator-help-card').hide();
    })

    $(".cancel-button").on('click', function() {
        $('#kwh-help-card').hide();
        if ( $('#calculator-help-card').is('.inactive') ) {
        $('#calculator-help-card').hide();
        } else {
            $('#calculator-help-carde').show();
        }
    })

    $(".cancel-button").on('click', function() {
        $('#roof-help-card').hide();
        if ( $('#calculator-help-card').is('.inactive') ) {
        $('#calculator-help-card').hide();
        } else {
            $('#calculator-help-carde').show();
        }
    })
    $(".cancel-button").on('click', function() {
        $('#azimuth-help-card').hide();
        if ( $('#calculator-help-card').is('.inactive') ) {
        $('#calculator-help-card').hide();
        } else {
            $('#calculator-help-carde').show();
        }
    })

    $(".cancel-button").on("click", function() {
        $('#system-help-card').hide();
        if ( $('#calculator-help-card').is('.inactive') ) {
        $('#calculator-help-card').hide();
        } else {
            $('#calculator-help-carde').show();
        }
    })
})
