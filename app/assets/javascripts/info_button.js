$(document).ready(function(){

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
        $('#calculator-help-card').show();
    })

    $(".cancel-button").on('click', function() {
        $('#roof-help-card').hide();
        $('#calculator-help-card').show();
    })
    $(".cancel-button").on('click', function() {
        $('#azimuth-help-card').hide();
        $('#calculator-help-card').show();
    })

    $(".cancel-button").on("click", function() {
        $('#system-help-card').hide();
        $('#calculator-help-card').show();
    })

    $(".nav-get-started").on("click", function() {
        $('#get-started-link').hide();
    })

    $("#logo-link").on("click", function() {
        $('#get-started').show();
    })
})
