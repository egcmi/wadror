var BREWERIES = {};

BREWERIES.show = function(){
    $("#brewerytable tr:gt(0)").remove();

    var table = $("#brewerytable");

    $.each(BREWERIES.list, function (index, beer) {
        table.append('<tr>'
            +'<td>'+beer['name']+'</td>'
            +'<td>'+beer['year']+'</td>'
            +'</tr>');
    });
};

BREWERIES.sort_by_name = function(){
    BREWERIES.list.sort( function(a,b){
        return a.name.toUpperCase().localeCompare(b.name.toUpperCase());
    });
};

BREWERIES.sort_by_year = function(){
    BREWERIES.list.sort( function(a,b){
        return a.year > b.year;
    });
};

BREWERIES.reverse = function(){
    BREWERIES.list.reverse();
};

$(document).ready(function () {
    $("#name").click(function (e) {
        BREWERIES.sort_by_name();
        BREWERIES.show();
        e.preventDefault();
    });

    $("#year").click(function (e) {
        BREWERIES.sort_by_year();
        BREWERIES.show();
        e.preventDefault();
    });

    if ( $("#brewerytable").length>0 ) {
      $.getJSON('breweries.json', function (breweries) {
        BREWERIES.list = breweries;
        BREWERIES.sort_by_name;
        BREWERIES.show();
      });
    }
});

$(document).ready(function () {
    $("#reverse").click(function (e) {
        BREWERIES.reverse();
        BREWERIES.show();
        e.preventDefault();
    });

    $.getJSON('breweries.json', function (breweries) {
        BREWERIES.list = breweries;
        BREWERIES.show();
    });
});