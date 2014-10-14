class UserBooksController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]
  def index
    @user_books = UserBook.order(created_at: :desc)
  end

  def show
    @user_book = UserBook.find(params[:id])
  end

  def new
    @user_book = UserBook.new
  end

  def create
    @user_book = UserBook.new(user_book_params)

    if @user_book.save
      redirect_to user_book_path(@user_book),
        notice: "Book successfully added."

      # UserMailer.book_email(@user_book).deliver
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
      redirect_to user_book_path(@user_book),
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
      :title,
      :author,
      :condition,
      :price
      ).merge(user: current_user)
  end
end
