var jQT = new $.jQTouch({
    icon: 'igf.png',
    // addGlossToIcon: false,
    // startupScreen: 'jqt_startup.png',
    statusBar: 'default',
    cacheGetRequests: false,
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
  $("a.clearStorage").click(function(e){
    localStorage.clear();
    $(this).parents("ul").slideUp();
    return false;
  });
});