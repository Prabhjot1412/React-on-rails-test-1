class Character < ApplicationRecord
  belongs_to :profile, optional: true

  validates :name, presence: true
end
