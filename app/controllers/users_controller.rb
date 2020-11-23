class UsersController < ApplicationController
  def index
    @book = Book.new
    @users = User.all
  end

  def create
    @user = User.new(book_params)
    @user.save
    redirect_to books_path(@user)
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books #ユーザの持っているbookを代入
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    flash[:notice] = "You have updated user successfully."
    if @user.update(user_params)
      redirect_to users_path
    else
      render "edit"
    end
  end

  private

  def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
