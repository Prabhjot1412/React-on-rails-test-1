class Profile < ApplicationRecord
  belongs_to :user

  has_many :characters

  DIFFICULTIES = [
    'easy',
    'medium',
    'hard'
  ]

end
