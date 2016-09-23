js

    $("#new-question").click(function(event){
      event.preventDefault();
      $(this).hide();
      $(this).parent().find(".new_question_form").removeClass("hidden");
    });

    $(".new_question_form").submit(function(event){
      event.preventDefault();
      var new_question = $(this).serialize();
      $.ajax({
        url: "/questions",
        method: "post",
        data: new_question
      }).done(function(response){
        debugger;
        $(".questions").closest("article").prepend(response);
        $("form").val("");
        $(".new_question_form").removeClass("hidden");
        $("#new-question").show();
      });
    });

erb
<% if logged_in? %>
<form class="hidden new_question_form" action="/questions" method="post">
  <input type="text" name="question[title]" placeholder="Question Title"></br>
  <input type="text" name="question[body]" placeholder="Put your question details here!"></br>

  <input type="submit" class="button" value="Submit">
</form>
<% end %>
