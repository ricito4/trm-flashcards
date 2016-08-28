get '/decks/:id' do
	Guess.destroy_all
	@round = Round.create(user_id: current_user.id, deck_id: params[:id])
	redirect "/decks/#{@round.id}/play"
end

get '/decks/:round_id/play' do
	@round = Round.find(params[:round_id])
	@deck = Deck.find(@round.deck_id)
	@cards = @deck.cards
	@guesses = Guess.where(user_id: current_user.id)
	used_card_guesses = @guesses.find_all {|guess| guess.correct == true}
	used_cards = @cards.find_all{|card| used_card_guesses.find{|guess| card.id == guess.card_id}}
	@cards -= used_cards
	@card = @cards.first
	if @cards.empty?
		redirect "/decks/#{@round.id}/stats"
	else
		erb :'users/play'
	end
end

post '/decks/:round_id/play' do
	@round = Round.find(params[:round_id])
	@card = Card.find(params[:card_id])
	if @card.answer.downcase == params[:answer].downcase
		Guess.create(user_id: current_user.id, card_id: @card.id, correct: true)
		redirect "/decks/#{params[:round_id]}/play"
	else
		Guess.create(user_id: current_user.id, card_id: @card.id, correct: false)
		erb :'users/play'
	end
end

get '/decks/:round_id/stats' do
  @round = Round.find(params[:round_id])
  @guesses = Guess.all
  @deck = Deck.find(@round.deck_id)
  @cards = @deck.cards
  @false_guesses = Guess.where(user_id: current_user.id, correct: false)
  @true_guesses = Guess.where(user_id: current_user.id, correct: true)
  @multiple_guesses = @true_guesses.find_all {|true_guess| @false_guesses.find{|false_guess| true_guess.card_id == false_guess.card_id}}
  @first_try = @true_guesses-@multiple_guesses
  erb :'/users/stats'
end
