class BooksController < ApplicationController
  def index
    @indexes = Book.all
    @books = Book.new
  end

  def create
    @books = Book.new(book_params)

    if @books.save
      flash[:success] = "Book was successfully created."
      redirect_to book_path(@books.id)
    else
      @indexes = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      flash[:successful] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private

  def book_params
  params.require(:book).permit(:title,:body)
  end
end