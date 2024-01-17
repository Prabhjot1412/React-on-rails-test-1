class MusicController < ApplicationController
  def create
    make_request do |errors, requests|
      raise "no song file provided" unless params[:song].present?
      music = Music.new
      music.user_id = current_user.id
      music.name = params[:name]
      music.song.attach(params[:song])
      music.thumbnail.attach(params[:thumbnail]) if params[:thumbnail].present? && params[:thumbnail] != "undefined"

      errors << music.errors.full_messages unless music.save
    end
  end
end
