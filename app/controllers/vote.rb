get '/questions/:id/upvote' do
  question = Question.find(params[:id])
  if !current_user.upvote_for?(question)
    current_user.upvote(question)
  end
  redirect "/questions/#{params[:id]}"
end

get '/questions/:id/downvote' do
  question = Question.find(params[:id])
  if !current_user.downvote_for?(question)
    current_user.downvote(question)
  end
  redirect "/questions/#{params[:id]}"
end
