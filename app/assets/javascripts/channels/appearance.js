App.appearance = App.cable.subscriptions.create({
  channel:'AppearanceChannel',
   room: window.location.pathname.split("/")[2]
 }, {
  received: function(data) {
    var membership = JSON.parse(data)
    if (membership.online === true){
      $(userImgIdConstructor(membership)).attr('class', 'active');
      var enter = $('#fixed-flash-enter')
      enter.text(membership.username + " has entered")
      fadeInOut(enter);
    };
    if (membership.online === false){
      $(userImgIdConstructor(membership)).attr('class', 'inactive');
      var leave = $('#fixed-flash-leave')
      leave.text(membership.username + " has left")
      fadeInOut(leave);
    };
  }
});


var userImgIdConstructor = function(membership){
  return "#" + membership.user_id + "-status";
}

var alertFade = function(el) {
   $(el).delay(500).fadeIn('normal', function() {
      $(this).delay(2500).fadeOut();
   });
}

var semanticFade = function(el){
  el.transition('vertical flip')
};

var fadeInOut = function(el){
  semanticFade(el);
  window.setTimeout(function(){semanticFade(el)},2000)
}