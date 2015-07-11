require_relative "../spec_helper"
describe "User" do
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
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  it "has decks" do
    expect(@joe.decks.first.name).to eq "Cool People"
  end

  it "has rounds" do
    expect(@joe.rounds.count).to eq 1
  end
end
