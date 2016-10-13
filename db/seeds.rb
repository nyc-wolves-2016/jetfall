users = []
20.times {
          users << User.create!(username: Faker::Internet.user_name,
                       email: Faker::Internet.email,
                       password: 'password'
          )
}
questions = []
20.times {
        questions << Question.create!(title: "#{Faker::Hacker.ingverb} #{Faker::Hacker.noun}",
                         body: (Faker::Hipster.paragraphs).join(" "),
                         user_id: users.sample.id
        )
}
answers = []
100.times {
        answers << Answer.create!(body: Faker::Hacker.say_something_smart,
                       user_id: users.sample.id,
                       question_id: questions.sample.id
        )
}
questions_answers = [questions, answers].flatten
comments = []
250.times {
          comments << Comment.create!(body: Faker::Hipster.sentence,
                          user_id: users.sample.id
          )
}
Comment.all.each do |comment|
  comment.commentable = questions_answers.sample
  comment.save
end
answers_comments_questions = [questions, answers, comments].flatten

1000.times {
          Vote.create!(value: [-1, 1].sample,
                                user_id: users.sample.id
          )
}
Vote.all.each do |vote|
  vote.votable = answers_comments_questions.sample
  vote.save
end
