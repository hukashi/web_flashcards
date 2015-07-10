class User < ActiveRecord::Base
  has_many :decks, foreign_key: :creator_id
  has_many :rounds, foreign_key: :player_id

  validates :first_name, :last_name, :email, :password_hash, :username, presence: true
  validates :email, :username, uniqueness: true

end
