$( document ).ready(function() {
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
});

var memberAppendBuilder = function(userData){
   return "<li>" + userData.username + "</li>";
};
