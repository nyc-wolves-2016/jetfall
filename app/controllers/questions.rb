get '/questions/new' do
  erb :'questions/new'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @author = User.find(@question.user_id)
  @answers = @question.answers
  @question_comments = @question.comments.order(created_at: :asc)
  if @question.answer_id != nil
    @best_answer = Answer.find(@question.answer_id)
    @answers = @answers.where.not(id: @question.answer_id)
  end

  erb :'questions/show'
end

post '/question/:id/best' do
  question = Question.find(params[:id])
  question.update_attribute(:answer_id, params[:answer_id])

  redirect "/questions/#{question.id}"
end

post '/questions' do
  question = Question.new(params[:question])
  if question.save
    question.user = current_user
    question.save
    redirect "/questions/#{question.id}"
  else
    @errors = question.errors.full_messages
    erb :'questions/new'
  end
end
