require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/play' do
    @player1_name = $Player1.name
    @player1_hp = $Player1.hit_points
    @player2_name = $Player2.name
    @player2_hp = $Player2.hit_points
    @game = session['game']
    erb(:play)
  end

  post '/names' do
    $Player1 = Player.new(params[:Player_1])
    $Player2 = Player.new(params[:Player_2])
    session['game'] = Game.new
    redirect to('/play')
  end

  get '/attack' do
    @player1_name = $Player1.name
    @player2_name = $Player2.name
    @game = session['game']
    @game.attack($Player2)
    erb(:attack)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
