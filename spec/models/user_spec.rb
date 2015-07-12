require_relative "../spec_helper"

describe User do
  it do
    should have_many(:decks).
      with_foreign_key(:creator_id)
  end

  it do
    should have_many(:rounds).
      with_foreign_key(:player_id)
  end

  it {should validate_presence_of :first_name }
  it {should validate_presence_of :last_name }
  it {should validate_presence_of :email }
  it {should validate_presence_of :password_hash }
  it {should validate_presence_of :username }

  # it {should validate_uniqueness_of :email }
  # it {should validate_uniqueness_of :username }
end
