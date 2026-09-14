class MainController < ApplicationController
  def index
    @books = Book.all
    render 'index'
  end

  def create
    Book.create!(name: params[:book_name])
    redirect_to main_index_path, notice: 'Book was added.'
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
    params.require(:book).permit(:name, :description, :position, :completed)
  end
end
