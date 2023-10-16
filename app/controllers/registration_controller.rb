class RegistrationController < ApplicationController
  def index
  end

  def new
    @registration_props = {
      csrf_token: session[:_csrf_token],
      create_path: '/registration',
      redirect_path: registration_index_path
    }
  end

  def create
    user = User.new(user_params)
    flash[:message] = user.save ? "Success" : user.errors.full_messages
    log_in_user(user_id: user.id)
    render json: {error_messages: user.errors.full_messages}
  rescue => error
    render error: error.message, status: 500
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
