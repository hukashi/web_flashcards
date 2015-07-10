class Round < ActiveRecord::Base
  belongs_to :deck
  belongs_to :player, class_name: 'User'
  has_many :guesses


end
