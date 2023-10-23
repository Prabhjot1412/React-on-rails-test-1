class AddDifficultyAndUsernameToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :username, :string
    add_index :profiles, [:username, :user_id], unique: true

    add_column :profiles, :difficulty, :string, default: 'easy'
  end
end
