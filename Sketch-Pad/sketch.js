$(document).ready(function() {

    gridGenerator(16);
    chooseColorRandom();
    
    
    $('#random').click(function() {
        var squares = prompt("Please choose number of squares (between 1 to 30)", 16);
        $('#grid').empty();
        gridGenerator(squares);
        chooseColorRandom();
    });
    
     $('#grey').on('click', function() {
        var squares = prompt("Please choose number of squares (between 1 to 30)", 16);
        $('#grid').empty();
        gridGenerator(squares);
        chooseColorDarker();
    });
    
    $('#black').on('click', function() {
       var squares = prompt("Please choose number of squares (between 1 to 30)", 16);
       $('#grid').empty();
       gridGenerator(squares);
       chooseColorBlack();     
    });
    
    $('#trailer').on('click', function() {
        var squares = prompt("Please choose number of squares (between 1 to 30)", 16);
        $('#grid').empty();
        gridGenerator(squares);
        chooseColorTrailer();
    }); 
});

var gridGenerator = function(squares) {
    while(isNaN(squares) || squares>30){
       squares = prompt("wrong input, Please choose number of squares (between 1 to 30)",16);
    }
    for (var i=0; i<squares;i++){
    $('#grid').append('<ul class="colum"></ul>');
  }

  for (var j=0; j<squares;j++){
    $('.colum').append('<li class="square"></li>');
  }
    };


function chooseColorRandom() {
    $('.square').hover(function() {
        color1 = (Math.floor(Math.random() * 256));
        color2 = (Math.floor(Math.random() * 256));
        color3 = (Math.floor(Math.random() * 256));
        $(this).css("background-color","rgb("+ color1 + "," + color2 + "," + color3 + ")") ;
    });
};

var chooseColorBlack = function () {
    $('.square').hover(function() {
        $(this).css("background-color","black") ;
    });
};

var chooseColorDarker= function  () {
    $('.square').hover(function() {
        opc = parseFloat($(this).css("opacity"));

        if(opc == 1) {
            $(this).css("opacity","0.3");
        } else if (opc > .8) {
            $(this).css("opacity","0.99");
        } else {
            opc += 0.2; 
            $(this).css("opacity",opc);
        }

        $(this).css("background-color","black");
    });
};

var chooseColorTrailer = function () {
    $('.square').hover(function() {
        $(this).css("background-color","black");
    }, function() {
        $(this).css("opacity","0.1");
        $(this).css("background-color","#E8E8E8");
        $(this).animate({"opacity": "1"}, 'slow');
    });
};
