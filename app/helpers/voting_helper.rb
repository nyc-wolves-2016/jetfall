def upvoted?(votable)
    current_user.upvote_for?(votable)
end

def upvoteRemoveDownvote(votable)
  if current_user.downvote_for?(votable)
    current_user.votes.find_by(votable: votable).destroy
  else
    current_user.upvote(votable)
  end
end


def downvoted?(votable)
  current_user.downvote_for?(votable)
end

def downvoteRemoveUpvote(votable)
  if current_user.upvote_for?(votable)
    current_user.votes.find_by(votable: votable).destroy
  else
    current_user.downvote(votable)
  end
end
