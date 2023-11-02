# frozen_string_literal: true

class Character < ApplicationRecord
  belongs_to :profile, optional: true

  validates :name, presence: true

  DEFAULT_AVATAR = 'placeholder'

  WARRIOR = 'warrior'

   SUPPORTED_CLASSES = [
     WARRIOR,
  ]

  before_save :set_character

  def set_character
    self.char_class = WARRIOR if self.char_class.blank?
  end
end
