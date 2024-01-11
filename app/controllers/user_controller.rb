class UserController < ApplicationController
  def fetch
    user_id = JwtService.decode(params[:token])[:user_id]
    @user = User.find_by(id: user_id)
    
    grps = []
  
    @user.groups.each do |group|
      hsh = {}
      hsh[:name] = group.name
      new_hsh = group.images.each_with_object({}) do |image, grp_hsh|
        grp_hsh[image.id] = url_for(image)
      end

      hsh[:images] = new_hsh.values
      hsh[:image_ids] = new_hsh.keys
      grps << hsh
    end
  
    render json: {**@user, groups: grps}, status: 200

  rescue => e
    render json: {error: e.message}, status: 500
  end
end
