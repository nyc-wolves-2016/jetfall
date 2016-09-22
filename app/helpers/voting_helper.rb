# module VoteHelper
  def upvoteHelper(votable)
    # binding.pry
    !current_user.upvote_for?(votable)
  end

  def downvoteHelper(votable)
    if current_user.downvote_for?(votable)
      current_user.votes.find_by(votable: votable).destroy
    else
      current_user.upvote(votable)
    end
  end

# end

# helpers VoteHelper
