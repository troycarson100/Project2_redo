class UsersController < ApplicationController
  before_action :authorize, only: [:show]

  def index
    @users = User.all
    # @posts = @users.posts.sort_by{ |p| p.score }.reverse
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.sort_by{ |p| p.score }.reverse
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    end
  end

  def destroy
    session[:user_id] = nil if params[:id].to_i == current_user.id
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(root_path)
  end

  private
  def user_params
  params.require(:user).permit(:name,:email,:bio, :password,:password_confirmation, :photo)
  end
end
