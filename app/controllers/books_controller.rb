class BooksController < ApplicationController
  def index
    @indexes = Book.all
    @books = Book.new
  end

  def create
    book = Book.new(book_params)

    book.save

    redirect_to '/books'
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(list.id)
  end

  private

  def book_params
  params.require(:book).permit(:title,:body)
  end
end