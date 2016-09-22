get '/questions/:id/upvote' do
  question = Question.find(params[:id])
  if upvoteHelper(question)
    downvoteHelper(question)
  end
  redirect "/questions/#{params[:id]}"
end

get '/questions/:id/downvote' do
  question = Question.find(params[:id])
  if !current_user.downvote_for?(question)
    if current_user.upvote_for?(question)
      current_user.votes.find_by(votable: question).destroy
    else
      current_user.downvote(question)
    end
  end
  redirect "/questions/#{params[:id]}"
end

get '/answers/:id/upvote' do
  answer = Answer.find(params[:id])
  if !current_user.upvote_for?(answer)
    current_user.upvote(answer)
  end
  redirect "/questions/#{answer.question_id}"
end

get '/answers/:id/downvote' do
  answer = Answer.find(params[:id])
  if !current_user.downvote_for?(answer)
    current_user.downvote(answer)
  end
  redirect "/questions/#{answer.question_id}"
end

get '/comments/:id/upvote' do
  comment = Comment.find(params[:id])
  if !current_user.upvote_for?(comment)
    # binding.pry
    current_user.upvote(comment)
  end
  redirect "/questions/#{comment.commentable.question.id}"
end

get '/comments/:id/downvote' do
  comment = Comment.find(params[:id])
  if !current_user.downvote_for?(comment)
    current_user.downvote(comment)
  end
  redirect "/questions/#{comment.commentable.question.id}"
end
