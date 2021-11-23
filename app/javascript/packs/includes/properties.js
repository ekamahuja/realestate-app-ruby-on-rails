(function(){
    console.log("tets")
    ("#toggleDescriptionBtn").on("click", function() {
    var details = $("#description-wrapper") ;
    details.toggleClass("open") ;
    });
});