require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/tower_of_hanoi'

enable :sessions

get '/' do
  game = TowerOfHanoi.new
  session[:towers] = game.towers
  erb :game, locals: { towers: session[:towers] }
end

post '/' do
  game = TowerOfHanoi.new
  game.towers = session[:towers]
  if game.valid_move?(params[:from].to_i, params[:to].to_i)
    game.move(params[:from].to_i, params[:to].to_i)
    win = "You win" if game.win?
    session[:towers] = game.towers
  else
    error_msg = "Invalid move"
  end
  erb :game, locals: {
    towers: session[:towers],
    error_msg: error_msg,
    win: win
  }
end
