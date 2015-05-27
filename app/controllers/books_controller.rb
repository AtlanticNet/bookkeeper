class BooksController < ApplicationController

  before_filter :authenticate_user!

  def index
    @books = current_user.books
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = current_user.books.build
  end

  def create
    @book = current_user.books.create(book_params)
    if @book.save
      flash[:notice] = "You have successfully created a book"
      redirect_to books_path
    else
      flash[:error] = "There was a problem with creating your book"
      render 'new'
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :comment, :author)
  end
end
