class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def create
    @user = User.new(book_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to books_path(@user)
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end
end
