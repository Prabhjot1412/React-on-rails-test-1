class MyappController < ApplicationController
  def user_images; end

  def create
    errors = []

    group = current_user.groups.find_or_create_by(name: params[:group_name])
    group.images.attach(params[:image])

    render json: {error_messages: errors}, status: 200
  rescue => error
    errors << error.message
    render json: {error_messages: errors}
  end

  def group_create
    errors = []

    current_user.groups.create(name: params[:group])

    render json: {error_messages: errors }, status: 200
  rescue => error
    errors << error.message
    render json: {error_messages: errors}
  end

  def user_create
    make_request(user_token: true) do |errors, request|
      user = User.new(user_params)

      if user.save
        request["user_token"] = log_in_user(user_id: user.id)
      else
        errors.concat user.errors.full_messages
      end
    end
  end

  def fetch_comments
    make_request do |errors, requests|
      requests["output"] = Image::FetchComments.call(image_id: params[:image_id])
    end
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end