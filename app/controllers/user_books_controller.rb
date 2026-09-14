class UserBooksController < ApplicationController
  before_action :set_user_book, only: %i[show edit update destroy]

  def index
    @user_books = UserBook.includes(:user, :book).order(:id)
  end

  def show
  end

  def new
    @user_book = UserBook.new
  end

  def edit
  end

  def create
    @user_book = UserBook.new(user_book_params)

    if @user_book.save
      redirect_to user_books_path, notice: "User book was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user_book.update(user_book_params)
      redirect_to user_books_path, notice: "User book was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user_book.destroy!
    redirect_to user_books_path, notice: "User book was successfully destroyed."
  end

  private

  def set_user_book
    @user_book = UserBook.find(params[:id])
  end

  def user_book_params
    params.require(:user_book).permit(:user_id, :book_id)
  end
end