class BooksController < ApplicationController
  def index
    if params[:search]
      @books = Book.search(params[:search]).order(:course).page(params[:page]).per(20)

      if @books.empty?
        @books = Book.order(:course).page(params[:page]).per(20)
        flash[:notice] = "Could not find your search term"
      end
    else
      books_array = Book.order(:course)
      @books = Kaminari.paginate_array(books_array).page(params[:page]).per(20)
    end
  end

  def show
    @book = Book.find(params[:id])
    @user_books = @book.user_books.order(created_at: :desc).page(params[:page]).per(5)
  end
end
