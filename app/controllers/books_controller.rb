class BooksController < ApplicationController
  def top
  end
  
  def index
  @books = Book.all
  end

  def show
  @book = Book.find(params[:id])
  end

  def create
  book = Book.new(books_params)
  book.save
  redirect_to books_path(book.id)
  end

  def edit
    @books = Book.find(params[:id])  
  end
  
  def update
    book = Book.find(params[:id])
    book.update(books_params)
    redirect_to book_path(book)
  end 
  
  private
  def books_params
   params.permit(:title, :body)
  end
  
  def destroy
   book = Book.find(params[:id])
    book.destroy
   flash[:notice] = "Book was successfully destroyed."
   redirect_to books_path
  end
  
 
end