users = []
100.times {
          users << User.create!(username: Faker::Internet.user_name,
                       email: Faker::Internet.email,
                       password: 'password'
          )
}
questions = []
50.times {
        questions << Question.create!(title: "#{Faker::Hacker.ingverb} #{Faker::Hacker.noun}",
                         body: Faker::StarWars.quote,
                         user_id: users.sample.id
        )
}
answers = []
150.times {
        answers << Answer.create!(body: Faker::Hacker.say_something_smart,
                       user_id: users.sample.id,
                       question_id: questions.sample.id
        )
}
questions_answers = [questions, answers].flatten
comments = []
500.times {
          comments << Comment.create!(body: Faker::Hipster.sentence,
                          user_id: users.sample.id
          )
}
comments.each do |comment|
  comment.commentable = questions_answers.sample
end
answers_comments_questions = [questions, answers, comments].flatten
votes = []
1000.times {
          votes << Vote.create!(value: [-1, 1].sample,
                                user_id: users.sample.id
          )
}
votes.each do |vote|
  vote.votable = answers_comments_questions.sample
end
