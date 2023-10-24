class Profile < ApplicationRecord
  belongs_to :user

  has_many :characters, dependent: :destroy

  DIFFICULTIES = [
    'easy',
    'medium',
    'hard'
  ]

  validates :username, presence: true, uniqueness: true
  validates :difficulty, presence: true
end
