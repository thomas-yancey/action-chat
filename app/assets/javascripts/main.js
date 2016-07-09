$( document ).ready(function() {

  if ($('#message-container').length > 0){
    scrollBottom();
  };

  $('#add-users input').on ('click', function(){
    var userId = $(this).attr("id").split("-")[0];
    var data = {user_id: userId};
    $.ajax({
      url: this.action,
      data: data,
      method: 'post'
    }).done(function(res){
      var userData = JSON.parse(res);
      $('#' + userData.id + "-add-member").parent().remove();
      $('#member-list').append(memberAppendBuilder(userData));
    });
  });

$('#new_message').on ('submit', function(){
    event.preventDefault();
    // make sure there is content
    if ($('#new_message [name="message[content]"]').val() === ""){
      return false;
    }

    $.ajax({
      url: this.action,
      data: $(this).serialize(),
      method: "post"
    }).done( function(res){
      // reset user input to empty
      $('#new_message [name="message[content]"]').val("");
    });
  });
});

var memberAppendBuilder = function(userData){
   return "<div class='ui segment'><li>" + userData.username + "</li></div>";
};

var scrollBottom = function(){
  $('html, body').animate({scrollTop: $(document).height()}, 2000);
};
