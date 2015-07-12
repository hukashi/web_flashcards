require_relative "../spec_helper"

describe Deck do
  it { should belong_to(:creator).class_name('User')}
  it { should have_many :cards }
  it { should have_many :rounds }
  it { should validate_presence_of :name }
end
