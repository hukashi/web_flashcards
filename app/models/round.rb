class Round < ActiveRecord::Base
  belongs_to :deck
  belongs_to :player, class_name: 'User'
  has_many :guesses
  has_many :cards, through: :deck

  def correct_guesses
    self.guesses.where(correct: true).count
  end

  def incorrect_guesses
    self.guesses.where(correct: false).count
  end
end
