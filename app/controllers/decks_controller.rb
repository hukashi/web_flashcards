get '/decks' do
  #lists all created decks
  @decks = Deck.all
  erb :'/decks/index'
end

get '/decks/new' do
  # -logged-in user sees new deck form
  erb :'decks/new'
end

post '/decks' do
  #create deck and cards, redirects to deck/:id
  deck = Deck.new(params[:deck])
  deck.save!
  redirect '/decks/#{deck.id}'
end

get '/decks/:id' do
  #lists cards in plain text - with option to edit or play
  @deck = Deck.find_by(params[:id])
  @cards = @deck.cards
  erb :'decks/show'
end

# *************************************************************************
# add these routes after MVP
# get '/decks/:id/edit' do
#   #edit form
# end

# put '/decks/:id' do
#   #updates the table for deck and its cards
# end
