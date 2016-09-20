class CommentsController < ApplicationController
  def index
  end

  def show

  end

  def new
  end

  def create
    # first find the post we want to comment on
    @post = Post.find(params[:post_id])

    # Create a new comment in this post's collection, aka add the post_id to the comment.
    @comment = @post.comments.create(comment_params)

    # add this comment to the current user's list of comments, aka fill in the user_id field on that comment.
    User.last.comments << @comment
    redirect_to post_path(@post)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
