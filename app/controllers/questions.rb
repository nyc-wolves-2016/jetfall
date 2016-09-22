get '/questions/new' do
  erb :'questions/new'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @author = User.find(@question.user_id)
  @answers = Answer.where(question_id: @question.id)

  erb :'questions/show'
end

post '/questions' do
  question = Question.new(params[:question])
  if question.save
    question.user = current_user
    question.save
    redirect "/questions/#{question.id}"
  else
    @errors = user.errors.full_messages
    erb :'questions/new'
  end
end

get '/questions/:id/upvote' do
  user_upvoted = Vote.find_by(user_id: current_user.id, votable_id: params[:id])
  if !user_upvoted
    question = Question.find(params[:id])
    question_vote = Vote.create(value: 1, user_id: current_user.id, votable: question)
    question.points
    redirect "/questions/#{question.id}"
  end
    redirect "/questions/#{params[:id]}"
end

get '/questions/:id/downvote' do
  question = Question.find(params[:id])
  question_vote = Vote.new(value: -1, user_id: current_user.id)
  question_vote.votable = question
  question_vote.save
  question.points
  redirect "/questions/#{question.id}"
end
