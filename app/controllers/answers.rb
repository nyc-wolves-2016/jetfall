post '/answers' do
  answer = Answer.new(params[:answer])
  if answer.save
    answer.user = current_user
    answer.save
    redirect "/questions/#{answer.question_id}"
  else
    @errors = user.errors.full_messages
    redirect "questions/#{answer.question_id}"
  end
end
