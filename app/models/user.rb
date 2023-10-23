class User < ApplicationRecord
  has_secure_password

  has_one :profile

  validates :username, uniqueness: true

  def to_hash
    {
      user: self.as_json,
      profile: self.profile&.as_json,
      characters: self.profile&.characters&.as_json
    }
  end
end
