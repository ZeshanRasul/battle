require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/play' do
    @game = $game
    @player1_name = @game.player_1.name
    @player1_hp = @game.player_1.hit_points
    @player2_name = @game.player_2.name
    @player2_hp = @game.player_2.hit_points
    erb(:play)
  end

  post '/names' do
    player_1 = Player.new(params[:Player_1])
    player_2 = Player.new(params[:Player_2])
    $game = Game.new(player_1, player_2)
    redirect to('/play')
  end

  get '/attack' do
    # @player1_name = $Player1.name
    # @player2_name = $Player2.name
    @game = $game
    @game.attack(@game.player_2)
    @game.switch_turns
    erb(:attack)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
