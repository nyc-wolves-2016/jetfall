class Question < ActiveRecord::Base
  belongs_to :user
  has_one :best_answer, class_name: "Answer"

  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :title, :body, presence: true
  validates :title, length: { maximum: 100,
    too_long: "%{count} characters is the maximum allowed" }
  validates :body, length: { maximum: 3000,
    too_long: "%{count} characters is the maximum allowed" }

  def total_votes
    self.votes.count
  end

  def total_answers
    self.answers.count
  end

  def points
    votes.sum(:value)
  end

  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end

end
