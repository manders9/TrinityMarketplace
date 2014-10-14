class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  devise_parameter_sanitizer.for(:sign_up) << [:username, :profile_photo]
end
