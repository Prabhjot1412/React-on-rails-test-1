class UserController < ApplicationController
  def fetch
    user_id = JwtService.decode(params[:token])[:user_id]
    @user = User.find_by(id: user_id)
    
    grps = []
  
    @user.groups.each do |group|
      hsh = {}
      hsh[:name] = group.name
      hsh[:images] = group.images.map {|image| url_for(image)}
      grps << hsh
    end
  
    render json: {**@user, groups: grps}, status: 200

  rescue => e
    render json: {error: e.message}, status: 500
  end
end
