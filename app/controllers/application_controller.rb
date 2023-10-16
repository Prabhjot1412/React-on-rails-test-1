class ApplicationController < ActionController::Base
  private

  def log_in_user(user_id:)
    session[:user_token] = JwtService.encode(user_id)
  end

  def current_user
    return if session[:user_token].nil?

    user_id = JwtService.decode(session[:user_token])[:user_id]
    User.find(user_id)
  end
end
