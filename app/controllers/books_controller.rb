class BooksController < ApplicationController
  def top
    
  end
  
  def index
     # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
     @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  
  def create
    book = Book.new(books_params)
    book.save
    redirect_to book_path(book.id)

  end

  def edit
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