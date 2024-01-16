class Music < ApplicationRecord
  belongs_to :user

  has_one_attached :song
  has_one_attached :thumbnail
end
