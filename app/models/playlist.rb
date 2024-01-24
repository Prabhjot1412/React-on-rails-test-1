class Playlist < ApplicationRecord
  belongs_to :user
  has_many :playlist_music, dependent: :destroy
  has_many :musics, through: :playlist_music
end
