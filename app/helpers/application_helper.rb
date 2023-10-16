module ApplicationHelper
  def navbar_props
    {}
  end

  def current_user
    return @current_user if @current_user.present?
    return if session[:user_token].nil?

    user_id = JwtService.decode(session[:user_token])[:user_id]
    @current_user = User.find(user_id)
  end
end
