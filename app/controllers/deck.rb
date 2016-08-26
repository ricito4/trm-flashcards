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


  @card= included_cards.shuffle[0]
  erb :"/decks/play"
end


post '/decks/:round_id/check' do
  card= Card.find_by(id: params[:card_id])

  if card.answer.downcase == params[:answer].downcase
    Guess.create(user_id: current_user.id, card_id: card.id, round_id: params[:round_id], correct: true)
    redirect "/decks/#{params[:round_id]}/play"
  else
    Guess.create(user_id: current_user.id, card_id: card.id, round_id: params[:round_id], correct: false)
    erb :"/decks/#{params[:round_id]}/play"
  end
end

