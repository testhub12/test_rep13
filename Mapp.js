
function initMappings() {
    resizeMappings();

    $(window).bind('resize', function () {
        resizeMappings();
    });

    window.onresize = function (event) {
        mappingssWindowResize();
    }
    window.onresize = function (event) {
        mappingsTabWindowResize();
    }

    window.onload = function (e) {
        resizeMappings();
    }
}
function resizeMappings() {
    height = calculateMarketMappingContentHeight();

    //there is some margin I cannot find right now
    //thowing off the height so this hack fixes it
    height -= 6;

    $("#mappingGeneralContent").height(height);


    var width = calculateMarketContentWidth();
    $("#divMarket").width(width);

    //need to make room for scroll bar
    $("#mappingGeneralContent").width(width - 15);
    var gridHeader = 40; // $("tr[id$='dgMarkets_top_head']").css('height');
    //$("table[id$='dgMarkets']").height(height - gridHeader);
    $('divMarketMapping').width(width);
    $('divMarketMapping').height(height - gridHeader);
    //adjust general tab controls
    var generalMappingHeader = $("#generalMappingHeader").height();

    $("#mappingGeneralContent").height(height - generalMappingHeader);
    $("#mappingGeneralContent").width(width + 5);

//    grid = $("table[id$='dgMarkets']");
//   
//    grid.width(width + 10);
//    grid.height(height + 20)
    //$('#divMarketMapping').height(height - 130);

    //dgMarkets.render();



}
function mappingsTabWindowResize() {
    var height = calculateMarketMappingContentHeight();
    var width = calculateMarketMappingContentWidth();
    $('#mappingGeneralContent').width(width + 100);
    $('#mappingGeneralContent').height(height - 15);

    //    //setTimeout('if( dgProducts ) dgProducts.render();', 100);
}
function mappingssWindowResize() {
   var height = calculateMarketMappingContentHeight();
   var width = calculateMarketMappingContentWidth();
   $('#divMarketMapping').width(width - 15);
   $('#divMarketMapping').height(height - 15);

//    //setTimeout('if( dgProducts ) dgProducts.render();', 100);
}
function calculateMarketMappingContentHeight() {
    var pageHeight = $("html").height();
    var headerHeight = $(".header").height();
    var footerHeight = $(".footer").height();
    var height = pageHeight - 150 - headerHeight - footerHeight;
    $("#divMarketMapping").height(height);
    height -= 40; // $("#divMarketHeader").height();
    return height;
}

function calculateMarketMappingContentWidth() {
    var width = $("html").width();
    width -= $(".SplitterPane").width();
    width -= $(".HorizontalSplitterBar").width();
    return $('.SplitterPaneContent').width();
}