$(function() {
  // question upvote
  $('.question-container').on('click', '.upvote', function(event) {
      event.preventDefault();
      // console.log('hey you clicked on me');

      // console.log($(this).attr('href'));
      var question_id = $(this).parent().find('span').attr('id');

      $.ajax({
        method: 'GET',
        url: $(this).attr('href')
      })
       .done(function(response) {
        $('#'+question_id).text(response+' points');
      });
  });

  // question downvote
  $('.question-container').on('click', '.downvote', function(event) {
    event.preventDefault();
    // console.log('hey you clicked on me');

    var question_id = $(this).parent().find('span').attr('id');
    // console.log(question_id);
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
    // console.log($(this).parent().parent().find('span'));
    console.log($(this).closest('li').attr('id'));
    var comment_id = $(this).parent().parent().find('span').attr('id');
    // console.log(comment_id);
    $.ajax({
      method: 'GET',
      url: $(this).attr('href')
    })
     .done(function(response) {
      //  console.log('hey are you there?');
      //  console.log(response);
      // console.log($('#'+comment_id).closest('span').val());
      $('#'+comment_id).text(response);
     })
  });
});
