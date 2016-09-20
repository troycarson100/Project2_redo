class PostsController < ApplicationController
  def index
    @posts = Post.order(vote: :desc)
  end

  def upvote
    @post = Post.find(params[:id])
    @post.vote += 1
    @post.save
    redirect_to :back
  end

  def downvote
    @post = Post.find(params[:id])
    @post.vote -= 1
    @post.save
    redirect_to :back
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.embed = params[:post][:embed]

    if @post.save
      redirect_to post_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to(posts_path)
  end
end
