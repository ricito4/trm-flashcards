get '/decks/:id/show' do
  @deck= Deck.find(params[:id])
  erb :'/decks/show'
end

get '/deck/:id/play' do
  @deck= Deck.find(params[:id])
  @guesses= Guess.where
  erb :"/decks/ask"
end


post '/decks/:id/check' do

end

