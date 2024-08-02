class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

  if @book.save
      render partial: "book", locals: {book: @book}
    else
      render :new
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
