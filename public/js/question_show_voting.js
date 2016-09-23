$(function() {
  // question upvote
  $('.question-container').on('click', '.upvote', function(event) {
      event.preventDefault();

      var question_id = $(this).next().next().attr('id');

      $.ajax({
        method: 'GET',
        url: $(this).attr('href')
      })
       .done(function(response) {
        //  console.log($('#'+question_id));
        $('#'+question_id).text(response+' points');
      });
  });

  // question downvote
  $('.question-container').on('click', '.downvote', function(event) {
    event.preventDefault();
    console.log('hey you clicked on me');

    var question_id = $(this).prev().prev().attr('id');
    console.log(question_id);

    $.ajax({
      method: 'GET',
      url: $(this).attr('href')
    })
     .done(function(response) {
       $('#'+question_id).text(response+ ' points');
     });
  });

  // question comment upvote
  $('.question_comments').on('click', '.upvote', function(event) {
    event.preventDefault();
    console.log('hey you clicked me');

    var comment_id = $(this).next().attr('id');

    console.log(comment_id);
    $.ajax({
      method: 'GET',
      url: $(this).attr('href')
    })
     .done(function(response) {
      //  console.log('hey are you there?');
      //  console.log(response);
      // console.log($('#'+comment_id).closest('span').val());
      // console.log($(event.target).next());
      $(event.target).next().text(response+ ' points');
     })
  });
});
