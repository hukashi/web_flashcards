class User < ActiveRecord::Base
  has_many :decks
  has_many :rounds

  validates :first_name, :last_name, :email, :password_hash, :username, presence: true
  validates :email, :username, uniqueness: true

end
