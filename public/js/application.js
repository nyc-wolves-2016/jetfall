$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $(".question-comment-link").click(function(event){
    event.preventDefault();
    $(this).hide();
    $("#new_comment_form").removeClass("hidden");
  });

  $("#new_comment_form").submit(function(event) {
    event.preventDefault();
    debugger;
    var comment = $(this).serialize();
    $.ajax({
      url: "/comments",
      method: "POST",
      data: comment
    }).done(function(response){
      alert(response);
      // $(".question_comments").find("p comment").last().after(response);
    });
  });
});
