class MainController < ApplicationController
  def index
    @books = Book.all
    render 'index'
  end

  def create
    if book_params.blank?
      redirect_to new_book_path, alert: "Book parameters are missing."
      return
    end
    book = Book.new(book_params)

    if book.save
      redirect_to main_index_path, notice: 'Book was added.'
    else
      redirect_to new_book_path, alert: "#{book.errors.full_messages.to_sentence}."
    end
  end

  def new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update!(book_params)
    redirect_to main_index_path, notice: 'Book was updated.'
  end

  def destroy
    Book.find(params[:id]).destroy!
    redirect_to main_index_path, notice: 'Book was deleted.'
  end

  def about
    @created_by = 'jacob'
    @id = params['id']
    @page = params[:page]
    #render 'about'
  end


  private

  def book_params
    params.require(:book).permit(
      :title, :author, :price, :published_date,
      :description, :position, :completed
    )
  end
end
