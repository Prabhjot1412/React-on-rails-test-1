class RegistrationController < ApplicationController
  skip_before_action :verify_authenticity_token, if: :frontend_request

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

  def login_api
    login
  end

  def create
    return login if params[:login]

    user = User.new(user_params)
    user.save

    log_in_user(user_id: user.id)
    render json: {error_messages: user.errors.full_messages}
  rescue => error
    render error: error.message, status: 500
  end

  private

  def user_params
    return params.require(:registration).permit(:username, :password) if frontend_request
    params.permit(:username, :password)
  end

  def login
    error_messages = []
    user = User.find_by_username(user_params[:username])&.authenticate(user_params[:password])

    error_messages << "invalid username or password" unless user
    token = log_in_user(user_id: user.id) if user

    render json: {error_messages: error_messages, user_token: token}
  rescue => e
    render json: { error_messages: [e.message] }
  end

  def frontend_request
    origin_url = request.headers["origin"]

    FRONTEND_URL.include?(origin_url)
  end
end
