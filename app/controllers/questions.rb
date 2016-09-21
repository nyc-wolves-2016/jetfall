get '/questions/new' do
  erb :'questions/new'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @author = User.find(@question.user_id)
  @answers = Answer.where(question_id: @question.id)
  @question_comments = @question.comments
  
  erb :'questions/show'
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
