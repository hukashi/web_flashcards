require_relative "../spec_helper"
describe "Card" do
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

    @card = @cards.first

    @round = Round.create(player_id: @joe.id, deck_id: @deck.id)

    @guess = Guess.create(card_id: @cards.first.id, round_id: @round.id)

  end

  after(:all) do
    DatabaseCleaner.clean
  end

  it "belongs to a deck" do
    expect(@card.deck.name).to eq "Cool People"
  end

  it "has many guesses" do
    expect(@card.guesses.first).to eq @guess
  end

  it { should validate_presence_of(:answer) }
  it { should validate_presence_of(:question) }
end
