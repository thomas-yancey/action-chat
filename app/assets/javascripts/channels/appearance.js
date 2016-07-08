App.appearance = App.cable.subscriptions.create({
  channel:'AppearanceChannel',
   room: window.location.pathname.split("/")[2]
 }, {
  received: function(data) {
    var membership = JSON.parse(data)
    if (membership.online === true){
      $(userImgIdConstructor(membership)).attr('class', 'active');
    };
    if (membership.online === false){
      $(userImgIdConstructor(membership)).attr('class', 'inactive');
    };
  }
});

var userImgIdConstructor = function(membership){
  return "#" + membership.user_id + "-status";
}

// var alertFade = function(el) {
//    $(el).delay(500).fadeIn('normal', function() {
//       $(this).delay(2500).fadeOut();
//    });
// }
