class User < ApplicationRecord
  has_secure_password

  has_many :profiles, dependent: :destroy

  validates :username, uniqueness: true

  def to_hash
    {
      user: self.as_json,
      profile: self.profiles&.map do |profile|
        profile.as_json.merge( { characters: profile.characters.as_json } )
      end
    }
  end
end
