best_team_ever = [
    ["Jonathan", "Chung", "jchung@dbc.com", "jchung", "peanut"],
    ["George", "Paul", "gpaul@dbc.com", "gpaul", "lamp"],
    ["Britney", "Wright", "bwright@dbc.com", "bwright", "sneaker"],
    ["Geovanna", "Rodriguez", "grod@dbc.com", "grod", "bubbles"]]


best_team_ever.each { |person| User.create(first_name: person[0], last_name: person[1], email: person[2], username: person[3], password: person[4]) }


deck1 = Deck.create(name: "Cool People")

cards = [
  ["On which side of the card do we find the question?", "front", deck1.id],
  ["On which side of the card do we find the answer?", "back", deck1.id]]

cards.each do |card|
  Card.create(question: card[0], answer: card[1], deck_id: deck1.id)
end

deck2 = Deck.create(name: "State Capitals")

File.readlines("../web_flashcards/db/state_capitals.txt").each_slice(2) {|question, answer| Card.create(question: question.chomp, answer: answer.chomp, deck_id: 2) }

deck3 = Deck.create(name: "Movie Quotes")

File.readlines("../web_flashcards/db/movie_quotes.txt").each_slice(2) {|question, answer| Card.create(question: question.chomp, answer: answer.chomp, deck_id: 3) }
