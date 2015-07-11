get '/game/:round_id' do
  # if round.completed == true show results
   #else
  # redirect to 1st card/ or next card to play
end

get '/game/:round_id/cards/:id'  do
  #displays card - question on top, form for guess below
end

post '/game/:round_id/cards/:id' do
  #@guess == params[:guess] == Card.find_by(id: params[:id]).answer
   # if@guess
      #redirect to /game/:round_id/cards/:id/
      #view can include @guess
      # if deck.cards.count == guesses.count
end