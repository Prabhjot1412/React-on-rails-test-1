class RegistrationController < ApplicationController
  def index
  end

  def delete
    reset_session
    redirect_to root_path
  end

  def show
    @login_props = {
      csrf_token: session[:_csrf_token],
      create_path: '/registration',
      redirect_path: root_path,
    }
  end

  def new
    @registration_props = {
      csrf_token: session[:_csrf_token],
      create_path: '/registration',
      redirect_path: root_path,
    }
  end

  def create
    return login if params[:login]

    user = User.new(user_params)
    log_in_user(user_id: user.id)
    render json: {error_messages: user.errors.full_messages}
  rescue => error
    render error: error.message, status: 500
  end

  private

  def user_params
    params.permit(:username, :password)
  end

  def login
    error_messages = []
    user = User.find_by_username(user_params[:username])&.authenticate(user_params[:password])

    error_messages << "invalid username or password" unless user
    log_in_user(user_id: user.id) if user

    render json: {error_messages: error_messages}
  rescue => e
    render json: { error_messages: [e.message] }
  end
end
