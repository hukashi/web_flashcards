require_relative "../spec_helper"
describe "Guess" do
  before(:all) do
    DatabaseCleaner.start

    @joe = User.create!(first_name: "Joe",
                         last_name: "Smith",
                         email: "test@example.com",
                         username: "first_player",
                         password: "peanut")


    @deck = Deck.create(name: "Cool People", creator_id: @joe.id)

    cards = [
      ["On which side of the card do we find the question?", "front"],
      ["On which side of the card do we find the answer?", "back"]
    ]

    cards.each do |card|
      Card.create(question: card[0], answer: card[1], deck_id: @deck.id)
    end

    @cards = Card.all

    @round = Round.create(player_id: @joe.id, deck_id: @deck.id)

    @guess = Guess.create(card_id: @cards.first.id, round_id: @round.id)
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  it "belongs to a card" do
    expect(@guess.card.question).to eq "On which side of the card do we find the question?"
    expect(@guess.card.answer).to eq "front"
  end

  it "belongs to a round" do
    expect(@guess.round).to eq @round
  end
end
