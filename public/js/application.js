$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  $(".question-comment-link").click(function(event){
    event.preventDefault();
    $(this).hide();
    $("#new_question_comment_form").removeClass("hidden");
  });

  $('.question-container').on('submit', '#new_question_comment_form', function(event) {
    event.preventDefault();
    var comment = $(this).serialize();
    $.ajax({
      url: "/comments",
      method: "POST",
      data: comment
    }).done(function(response){
      $(event.target).parent().find(".question_comments").append(response);
      $("#new_question_comment_form").addClass("hidden");
      $(".question-comment-link").show();
    });
  });

  $(".best-answer-comment-link").click(function(event){
    event.preventDefault();
    $(this).hide();
    $(".new_best_answer_comment_form").removeClass("hidden");
  });

  $('.best-answer-container').on('submit', '.new_best_answer_comment_form', function(event) {
    event.preventDefault();
    var comment = $(this).serialize();
    $.ajax({
      url: "/comments",
      method: "POST",
      data: comment
    }).done(function(response){
      $(event.target).parent().find(".best_answer_comments").append(response);
      $(".new_best_answer_comment_form").addClass("hidden");
      $(".best-answer-comment-link").show();
    });
  });

  $(".answer-comment-link").click(function(event){
    event.preventDefault();
    $(this).hide();
    $(this).parent().find(".new_answer_comment_form").removeClass("hidden");

  });

  $("#answer-container").on("submit", ".new_answer_comment_form", function(event) {
    event.preventDefault();
    var comment = $(this).serialize();
    var answer_id = $(this).closest("article").attr("id");
    $(this).find(".answer-comment").val("")
    $.ajax({
      url: "/comments",
      method: "POST",
      data: comment
    }).done(function(response){
      $(event.target).parent().find(".answer_comments").append(response);
      $("form").val("");
      $(".new_answer_comment_form").addClass("hidden");
      $(".answer-comment-link").show();
    });

  });


});
