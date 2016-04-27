$(document).ready(function(){

    $("#info_kwh").on('click', function() {
        $('#kwh-help-card').toggle();
    })

    $("#info_roof").on('click', function() {
        $('#roof-help-card').toggle();
    })

    $("#info_azimuth").on('click', function() {
        $('#azimuth-help-card').toggle();
    })

    $("#info_system").on('click', function() {
        $('#system-help-card').toggle();
    })
})
