class UsersController < ApplicationController
  def create
    @user = User.new(book_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to books_path(@user)
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end
end
