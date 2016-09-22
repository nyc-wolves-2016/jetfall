class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  validates :username, :email, presence: true, uniqueness: true
  validates :email, format: { with: VALID_EMAIL_REGEX }

  has_secure_password

  def upvote(question)
    self.votes.new(value: 1, votable: question).save
  end

  def downvote(question)
    self.votes.new(value: -1, votable: question).save
  end

  def upvote_for?(question)
    vote_object = self.votes.find_by(votable: question)
    vote_object.value == 1 if vote_object
  end

  def downvote_for?(question)
    vote_object = self.votes.find_by(votable: question)
    vote_object.value == -1 if vote_object
  end
end
