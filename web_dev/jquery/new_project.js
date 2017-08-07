$(document).ready(function(){
    $("button").click(function(){
        $("h1").hide();
    });
});

$(document).ready(function(){
    $("p").click(function(){
        $("p").hide();
    });
});

$("#unhide").click(function(){
    $("p").show();
});