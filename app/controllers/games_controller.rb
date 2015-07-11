post '/games' do
  @round = Round.new(params[:round]) #this is the player id and deck id
  if @round.save
    redirect :"/games/#{@round.id}"
  else
    rediect :index
  end
end

get '/games/:id' do
  @round = Round.find(:id)
  if @round.completed == true
    erb :'game/stats'
  elsif
    round.guesses.count = 0
    redirect :"/game/stats/#{@round.id}/cards/1"
  else
    last_played = round.guesses.last.card_id
    deck_index = @round.cards.index(last_played)
    redirect :"/game/stats/#{@round.id}/cards/#{deck_index + 1}"
   end
end

get '/games/:round_id/cards/:index'  do
  @round = Round.find(params[:round_id])
  @card = @round.card[params[:index] - 1]
  erb :'games/card_question'
end

post '/games/:round_id/cards/:index' do
  @guess = Guess.new(params[:guess])
  if @guess.save
    erb :'games/card_answer'
  else
    erb :'games/card_question'
  end
end
