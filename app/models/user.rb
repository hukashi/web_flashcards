class User < ActiveRecord::Base
  include BCrypt

  has_many :decks, foreign_key: :creator_id
  has_many :rounds, foreign_key: :player_id

  validates :first_name, :last_name, :email, :password_hash, :username, presence: true
  validates :email, :username, uniqueness: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(email, password)
  end

end
