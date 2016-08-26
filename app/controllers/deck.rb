get '/decks/:id/show' do
  current_round= Round.create(user_id: current_user.id, deck_id: params[:id])

  redirect "/decks/#{current_round.id}/play"
end

get '/decks/:round_id/play' do
  @round= Round.find(params[:round_id])
  @deck= Deck.find_by(id: @round.deck_id)
  @cards= Card.where(deck_id: @deck.id)

  @guesses= Guess.where(round_id: @round.id)
  correct_guesses= []

  @guesses.each do |guess|
    if guess.correct
      correct_guesses << guess
    end
  end

  included_cards= []
  @cards.each do |card|
    value= true
    correct_guesses.each do |guess|
      if card.id == guess.card_id && guess.correct
        value= false
      end
    end
    if value == true
      included_cards << card
    end
  end

    if included_cards.empty?
      redirect "/decks/#{@round.id}/finish"
    else
      @card= included_cards.shuffle[0]
      erb :"/decks/play"
    end
end


post '/decks/:round_id/check' do
  card= Card.find_by(id: params[:card_id])

  if card.answer.downcase == params[:answer].downcase
    Guess.create(user_id: current_user.id, card_id: card.id, round_id: params[:round_id], correct: true)
    redirect "/decks/#{params[:round_id]}/play"
  else
    Guess.create(user_id: current_user.id, card_id: card.id, round_id: params[:round_id], correct: false)
    redirect "/decks/#{params[:round_id]}/play"
  end
end

get "/decks/:round_id/finish" do
  @round= Round.find(params[:round_id])
  @deck= Deck.find_by(id: @round.deck_id)
  @guesses= Guess.where(round_id: @round.id)

  # @correct_guesses = []
  @true_guesses = []
  false_guesses = []

  @guesses.each do |guess|
    if guess.correct
      @true_guesses << guess
    else
      false_guesses << guess
    end
  end

  false_guesses.each do |f_guess|
    @true_guesses.delete_if do |t_guess|
      t_guess.card_id == f_guess.card_id
    end
  end

  erb :'/decks/finish'
end
