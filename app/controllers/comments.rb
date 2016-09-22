get '/questions/:id/comments/new' do
  @question = Question.find(params[:id])
  erb :'comments/new_question_comment'
end

get '/answers/:id/comments/new' do
  @answer = Answer.find(params[:id])
  erb :'comments/new_answer_comment'
end


post '/comments' do
  comment = Comment.new(body: params[:body], commentable_id: params[:commentable_id], commentable_type: params[:commentable_type])
  if comment.commentable_type == "Question"
    question_id = comment.commentable_id
    if comment.save
      comment.user = current_user
      comment.save
      if request.xhr?
        erb :'/comments/_comment', locals: {comment: comment}, layout: false
      else
        redirect "/questions/#{question_id}"
      end
    else
      @errors = comment.errors.full_messages
      erb :'comments/new'
    end
  elsif comment.commentable_type == "Answer"
    answer = Answer.find(comment.commentable_id)
    question_id = answer.question.id
    if comment.save
      comment.user = current_user
      comment.save
      redirect "/questions/#{question_id}"
    else
      @errors = comment.errors.full_messages
      erb :'comments/new'
    end
  end
end
