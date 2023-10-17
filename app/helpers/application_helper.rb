module ApplicationHelper
  def navbar_props
    {
      logged_in: current_user.present?,
      username: current_user&.username
    }
  end

  def current_user
    nil
    return if session[:user_token].nil?

    user_id = JwtService.decode(session[:user_token])[:user_id]
    User.find(user_id)
  end
end
