class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :body, presence: true

  def points
    votes.sum(:value)
  end

end
