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
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog)
  end 
  
  private
  def books_params
   params.permit(:title, :body)
  end
  
  def destroy
   book = Book.find(params[:id])
   book.destroy
   flash[:notice] = "Book was successfully destroyed."
   redirect_to books_path(book.id)
  end
end