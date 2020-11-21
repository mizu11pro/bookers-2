class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.new(book_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to books_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def book_params
  paarams.require(:user).permit(:user_id)
  end
end
