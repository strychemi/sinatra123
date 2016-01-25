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
  session[:towers] = game.towers
  session[:move] = [params[:from], params[:to]]
  erb :game, locals: { towers: session[:towers] }
end
