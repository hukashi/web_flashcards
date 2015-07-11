post '/games' do
  p "******************"
  p params[:round]
  p current_user
  p "******************"
  @round = Round.new(params[:round])
  if @round.save
    redirect :"/games/#{@round.id}"
  else
    rediect :index
  end
end

get '/games/:id' do
  require_logged_in
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

get '/games/:round_id/cards/:index' do
  require_logged_in
  @deck_index = params[:index]
  @round = Round.find(params[:round_id])
  @deck = @round.deck
  @card = @round.cards[@deck_index.to_i - 1]
  @guess = Guess.find_by(round_id: @round.id, card_id: @card.id)
  if @guess
    if @card == @round.cards.last
       @round.update(completed: true)
    end
    erb :'games/card_answer'
  else
    erb :'games/card_question'
  end
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
  @guess.save
  redirect "/games/#{params[:round_id]}/cards/#{params[:id]}"
end
