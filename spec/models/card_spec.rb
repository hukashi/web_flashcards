require_relative "../spec_helper"

describe Card do
  it { should belong_to :deck }
  it { should have_many :guesses }
  it { should validate_presence_of(:question)}
  it { should validate_presence_of(:answer)}
end
