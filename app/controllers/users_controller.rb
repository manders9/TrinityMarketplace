class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_books = @user.user_books
  end
end
