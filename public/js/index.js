var jQT = new $.jQTouch({
    icon: 'igf.png',
    addGlossToIcon: false,
    // startupScreen: 'jqt_startup.png',
    statusBar: 'default',
    cacheGetRequests: true,
    preloadImages: [
        '/css/img/back_button.png',
        '/css/img/back_button_clicked.png',
        '/css/img/button_clicked.png',
        '/css/img/grayButton.png',
        '/css/img/whiteButton.png',
        '/css/img/loading.gif'
        ]
});

$(function() {
  $('form#newFight').submit(function(e){
    jQT.submitForm(e, function(success){
      if (success)
        $("#fights").load("/fights");
    });
    return false;
  });

  // var a_event = $.support.touch ? 'tap' : 'click';
  $('#fights a').bind('tap', function(e){
    // pageTracker._trackPageview($(e.target).attr("href"));
    return true;
  });

  // function addFight(name, data) {
  //   var fights = localStorage.getItem('fights');
  //   if (fights) {
  //     fights = fights.split(':');
  //   } else {
  //     fights = [];
  //   }
  //
  //   if ($.inArray(name, fights) < 0) {
  //     fights.push(name);
  //     localStorage.setItem('fights', fights.join(':'));
  //   }
  //
  //   localStorage.setItem(name, data.join(':'));
  //
  //   $('#debug').append('<br>Fights: '+localStorage.getItem('fights').split(':'));
  //   $.each(fights, function(i, e) {
  //     $('#debug').append('<br>'+e+': '+localStorage.getItem(e).split(':').join(', '));
  //   });
  // };
  //
  // function getFight(name) {
  //   [ localStorage.getItem(name+'.1').split(':'),
  //     localStorage.getItem(name+'.2').split(':') ]
  // };
  //
  // function clearFights() {
  //   localStorage.clear();
  // };
  //
  // $('a.clearStorage').click(function(e){
  //   clearFights();
  //   $(this).parents('ul').slideUp();
  //   return false;
  // });
});