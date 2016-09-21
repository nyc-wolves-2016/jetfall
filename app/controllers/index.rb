get '/' do
  @questions = Question.all.order('created_at desc').limit(15)
  erb :'questions/index'
end
