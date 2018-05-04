require 'sinatra'

before do
  content_type :txt
  @defeat = {rock: :scissors, paper: :rock, scissors: :paper}
  @throws = @defeat.keys
end

get '/throw/:type' do
  player_throw = params[:type].to_sym
  halt 403, "'#{player_throw}' is invalid. You must throw one of: #{@throws}" unless @throws.include?(player_throw)

  computer_throw = @throws.sample

  return "Both players threw #{computer_throw}.  It is a tie." if computer_throw == player_throw
  return "#{player_throw} beats #{computer_throw}.  You win!" if player_throw == @defeat[:computer_throw]
  "#{computer_throw} beats #{player_throw}.  Computer wins!"
end
