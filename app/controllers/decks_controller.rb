get '/decks' do
  #lists all created decks
end

get '/decks/new' do
  # -logged-in user sees new deck form
end

post '/decks' do
  #create deck and cards, redirects to deck/:id
end

get '/decks/:id' do
  #lists cards in plain text - with option to edit or play
end

get '/decks/:id/edit' do
  #edit form
end

put '/decks/:id' do
  #updates the table for deck and its cards
end
