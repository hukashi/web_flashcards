require_relative "../spec_helper"

describe Round do
  it { should belong_to :deck }
  it { should belong_to(:player).class_name('User') }
  it { should have_many :guesses}
  it { should have_many(:cards).through(:deck)}
end
