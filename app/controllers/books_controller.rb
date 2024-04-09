class BooksController < ApplicationController
  

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(list_params)
    if @book.save
    redirect_to '/books'
    else
    @books=Book.all
    render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(list_params)
    redirect_to book_path(book.id)
  end
  
  def destroy
    book= Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  private
  
  def list_params
    params.require(:book).permit(:title, :body)
  end
end
