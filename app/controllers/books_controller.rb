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
  @book = Book.new(books_params)
  if @book.save
  flash[:notice] = "Book was successfully created."
  redirect_to book_path(@book.id)
  else
      render("books")
  end  
  end

  def edit
    @books = Book.find(params[:id])  
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(books_params)
     flash[:update] = "Book was successfully updated."
    redirect_to book_path(@book)
    else
       render ("book")
    end
  end 
  
  def destroy
   book = Book.find(params[:id])
   if book.destroy
   flash[:destroy] = "Book was successfully destroyed."
   redirect_to books_path
   end
  end 
  
  private
  def books_params
   params.require(:book).permit(:title, :body)
  end
end