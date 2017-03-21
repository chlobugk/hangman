require 'sinatra'
require_relative 'hangman'

get '/' do
	erb :names
end

post '/names' do
	backend_p1_name = params[:p1_name_input]
	backend_p2_name = params[:p2_name_input]
	erb :secret_word, :locals => {:p1 => backend_p1_name, :p2 => backend_p2_name}
end

post '/secret_word' do
	backend_secret_word = params[:secret_word_input]
	backend_p1_name = params[:p1_name_input]
	backend_p2_name = params[:p2_name_input]
	underscores = backend_secret_word.gsub(/[abcdefghijklmnopqrstuvwxyz]/, '_ ')
	underscores.chars
	erb :guess, :locals => {:underscores => underscores, :secret => backend_secret_word, :p1 => backend_p1_name, :p2 => backend_p2_name}
end
	









