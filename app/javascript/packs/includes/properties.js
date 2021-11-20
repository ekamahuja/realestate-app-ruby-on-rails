$(function(){
    $("#toggleDescriptionBtn").on("click", function() {
    var details = $("#description-wrapper") ;
    details.toggleClass("open") ;
    });
});