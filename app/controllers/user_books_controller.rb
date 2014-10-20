class UserBooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @user_books = UserBook.all
    @users = User.all
  end

  def show
    @user_book = UserBook.find(params[:book_id])
  end

  def new
    @book = Book.find(params[:book_id])
    @user_book = UserBook.new
  end

  def create
    @book = Book.find(params[:book_id])
    @user_book = UserBook.new(user_book_params)
    @user_book.book_id = params[:book_id]

    if @user_book.save
      redirect_to "/books/#{@user_book.book_id}",
        notice: "Book successfully added."
    else
      render :new
    end
  end

  def edit
    @user_book = UserBook.find(params[:id])
  end

  def update
    @user_book = UserBook.find(params[:id])

    if @user_book.update(user_book_params)
      redirect_to "/books/#{@user_book.book_id}/user_books/#{@user_book.id}",
        notice: "Book successfully updated."
    else
      render "edit"
    end
  end

  def destroy
    @user_book = UserBook.find(params[:id])
    @user_book.destroy
    redirect_to user_books_path,
      notice: "Book successfully deleted."
  end

  private

  def user_book_params
    params.require(:user_book).permit(
      :user,
      :book,
      :condition,
      :price
      ).merge(user: current_user)
  end
end
