post '/games' do
  @round = Round.new(params[:round]) #this is the player id and deck id
  if @round.save
    redirect :"/games/#{@round.id}"
  else
    rediect :index
  end
end

get '/games/:id' do
  @round = Round.find(params[:id])
  if @round.completed == true
    erb :"games/stats"
  elsif
    @round.guesses.count == 0
    redirect :"/games/#{@round.id}/cards/1"
  else
    last_played = @round.guesses.last.card_id
    deck_index = @round.cards.index(last_played)
    redirect :"/games/#{@round.id}/cards/#{deck_index.to_i + 1}"
   end
end

get '/games/:round_id/cards/:index'  do
  @deck_index = params[:index]
  @round = Round.find(params[:round_id])
  @deck = @round.deck
  @card = @round.cards[@deck_index.to_i - 1]
    erb :'games/card_question'
end

get '/games/:round_id/cards/:id/answer' do
  @round = Round.find(params[:round_id])
  @card = @round.cards[params[:id].to_i - 1]
  @deck = @round.deck
  @guess = Guess.find_by(round_id: @round.id, card_id: @card.id)
  erb :'games/card_answer'
end

post '/games/:round_id/cards/:id/answer' do
  @guess = Guess.new(params[:guess])
  @round = Round.find(params[:round_id])
  @card = @round.cards[params[:id].to_i - 1]
  if params[:player_answer] == @card.answer 
    @guess.correct = true
  else
    @guess.correct = false
  end
  if @guess.save
    redirect "/games/#{params[:round_id]}/cards/#{params[:id]}/answer"
  else
    erb :'games/card_question'
  end
end
