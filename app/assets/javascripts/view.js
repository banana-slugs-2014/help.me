HelpMe.View = function(sel){
  this.sel = sel;
}

HelpMe.View.prototype = {
  renderPlace: function(place){

    google.maps.event.addDomListener(window, 'load', getLocation);

    $('.hungry').replaceWith(place);
  },
  showSuccess: function(partial){
    $('body').html(partial);
    console.log('it got here')
  }

}