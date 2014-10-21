class BooksController < ApplicationController
  def index
    if params[:search]
      @books = Book.search(params[:search]).order(:course)

      if @books.empty?
        @books = Book.order(:course)
        flash[:notice] = "Could not find your search term"
      end
    else
      @books = Book.order(:course)
    end
  end

  def show
    @book = Book.find(params[:id])
    @user_books = @book.user_books.order(created_at: :desc)
  end
end
