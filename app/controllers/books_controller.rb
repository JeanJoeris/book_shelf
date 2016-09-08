class BooksController < ApplicationController
  before_action :do_the_thing, only: [:show, :index]

  def index
    if current_user
      @books = current_user.books.all
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @categories = Category.all
  end

  def edit
    @book = Book.find( params[:id] )
    @categories = Category.all
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      flash[:notice] = "The book #{@book.title} was created"
      session[:most_recent_book_id] = @book.id
      redirect_to book_path(@book)
    else
      flash[:error] = @book.errors.full_messages.join(", ")
      render :new
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    session[:most_recent_book_id] = Book.last.id

    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :price, :quantity, :category_id)
  end
end
