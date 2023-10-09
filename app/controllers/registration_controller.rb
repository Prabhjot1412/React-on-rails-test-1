class RegistrationController < ApplicationController
  def index
  end

  def new
    @registration_props = {
      csrf_token: session[:_csrf_token],
      create_path: '/registration',
      redirect_path: registration_index_path,
    }
  end

  def create
    User.create!(user_params)
    flash[:message] = "success"
  rescue => error
    flash[:message] = "error: #{error.message}"
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
