class Character < ApplicationRecord
  belongs_to :profile, optional: true
end
