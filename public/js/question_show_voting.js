$(function() {
  // question upvote
  $('.question-container').on('click', '.upvote', function(event) {
      event.preventDefault();
      console.log('hey you clicked on me');

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
});
