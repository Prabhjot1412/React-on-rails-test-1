class MyappController < ApplicationController
  def user_images; end

  def create
    errors = []
    
    group = current_user.groups.first_or_create(name: params[:group_name])
    group.images.attach(params[:image])

    render json: {error_messages: errors}, status: 200
 
  rescue => error
    errors << error.message
    render json: {error_messages: errors}
  end
end