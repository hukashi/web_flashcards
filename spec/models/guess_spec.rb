require_relative "../spec_helper"

describe Guess do
  it { should belong_to :card }
  it { should belong_to :round }
end
