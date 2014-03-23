HelpMe.Controller = function(view, user){
  this.user = user;
  this.view = view;
}

HelpMe.Controller.prototype = {

  findUserLocation: function(){
    this.user.getPos();
  },

  findNearbyRestaurants: function(){
    var position = this.user.position;
    var opts = {
      url: '/create',
      type: 'post',
      data: {userLocation: JSON.stringify(position)}
    };

    this.ajaxCaller(opts);

  },

  ajaxCaller: function(opts){
    $.ajax(opts)
    .done(function(){
      console.log("you did a thing!")
    })
    .fail(function(){
      console.log('ajax request to create a new restaurant failed')
    });
  }
}