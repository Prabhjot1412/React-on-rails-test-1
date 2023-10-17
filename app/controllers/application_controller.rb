class ApplicationController < ActionController::Base
  private

  def log_in_user(user_id:)
    session[:user_token] = JwtService.encode(user_id)
  end

  def current_user
    return if session[:user_token].nil?
    return if expired?

    user_id = JwtService.decode(session[:user_token])[:user_id]
    User.find(user_id)
  end

  def expired?
    generated_at = JwtService.decode(session[:user_token])[:generated_at].to_datetime
    return false if generated_at > 6.hours_ago

    reset_session
    true
  end
end
