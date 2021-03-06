require 'sinatra/base'
require_relative 'lib/player'
require_relative 'lib/game'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post "/names" do
    player01 = Player.new(params[:player01])
    player02 = Player.new(params[:player02])
    $game = Game.new(player01, player02)
    redirect "/play"
  end

  get "/play" do
    @game = $game
    erb :play
  end

  get "/attack" do
    @game = $game
    @game.attack(@game.player02) if @game.turn == @game.player01
    @game.attack(@game.player01) if @game.turn == @game.player02
    erb :attack
  end

  get "/switch" do
    @game = $game
    @game.switch_turn
    redirect "/play"
  end

  run! if app_file == $0

end
