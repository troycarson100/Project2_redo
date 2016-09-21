class VotesController < ApplicationController
  def upvote
    # is there a vote already by that user for that story
    @vote = Vote.find_by({post_id: params[:post_id], user_id: current_user.id})
    if @vote
      @vote.sentiment = 1
    else
      @post = Post.find(params[:post_id])
      @vote = @post.votes.new({sentiment: 1})
      @vote.user = current_user
    end
    @vote.save
    redirect_to posts_path
  end

  def downvote
    # is there a vote already by that user for that story
    @vote = Vote.find_by({post_id: params[:post_id], user_id: current_user.id})
    if @vote
      @vote.sentiment = -1
    else
      @post = Post.find(params[:post_id])
      @vote = @post.votes.new({sentiment: -1})
      @vote.user = current_user
    end
    @vote.save
    redirect_to posts_path
  end
end
