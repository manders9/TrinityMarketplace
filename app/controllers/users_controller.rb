class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def show
    @user = User.find(params[:id])
    @user_books = @user.user_books
  end

  # def edit
  #   # authorize! :update, @user
  # end

  # # PATCH/PUT /users/:id.:format
  # def update
  #   authorize! :update, @user
  #   if @user.update(user_params)
  #     sign_in(@user == current_user ? @user : current_user, bypass: true)
  #     redirect_to @user, notice: 'Your profile was successfully updated.'
  #   else
  #     render action: 'edit'
  #     # format.json { render json: @user.errors, status: :unprocessable_entity }
  #   end
  # end

  # GET/PATCH /users/:id/finish_signup
  def finish_signup
    # authorize! :update, @user
    if request.patch? && params[:user] #&& params[:user][:email]
      if current_user.update(user_params)
        # current_user.skip_reconfirmation!
        sign_in(current_user, bypass: true)
        redirect_to current_user, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  # DELETE /users/:id.:format
  def destroy
    # authorize! :delete, @user
    @user.destroy
    redirect_to root_url
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      accessible = [ :username, :email ] # extend with your own params
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(accessible)
    end
end
