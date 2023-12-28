class UserController < ApplicationController
  def fetch
    user_id = JwtService.decode(params[:token])[:user_id]
    @user = User.find_by(id: user_id)

    render json: @user, status: 200

  rescue => e
    render json: {error: e.message}, status: 500
  end
end
