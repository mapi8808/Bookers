class BooksController < ApplicationController
  def top
  end
  
  def index
  @books = Book.all
  end

  def show
  @books = Book.find(params[:id])
  end

  def create
  book = Book.new(books_params)
  book.save
  redirect_to books_path(book.id)
  end

  def edit
    @books = Book.find(params[:id])  
  end
  
  private
  def books_params
  params.permit(:title, :body)
  end

  
  def destroy
  book = book.find(params[:id])
  book.destroy
  redirect_to books_path
  end
end