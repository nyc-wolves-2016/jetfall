post '/answers' do
  answer = Answer.new(params[:answer])
  @question = Question.find(answer.question_id)
  @author = User.find(@question.user_id)
  @answers = Answer.where(question_id: @question.id)
  if answer.save
    answer.user = current_user
    answer.save
    redirect "/questions/#{answer.question_id}"
  else
    @errors = answer.errors.full_messages
    erb :'questions/show'
  end
end
