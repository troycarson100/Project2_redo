class PostsController < ApplicationController
  def index
    @posts = Post.all.sort_by{ |p| p.score }.reverse
    @best = @posts.first
    @new_post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @story = Story.new
  end

  def create
    @post = Post.new
    @post.user = current_user
    @post.vote = 0
    if params[:post][:embed][0,32] == '<iframe width="100%" height="166'
       @post.embed = params[:post][:embed]
    if @post.save
        redirect_to root_path
    end
    else
        redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @post= Post.find(params[:id])
    @post.destroy
    redirect_to posts_path

    unless @post.comments.count == 0
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to posts_path
    end

  end
end
