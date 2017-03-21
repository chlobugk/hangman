require 'sinatra'
require_relative 'hangman'

enable :sessions

get '/' do
	erb :names
end

post '/names' do
	backend_p1_name = params[:p1_name_input]
	backend_p2_name = params[:p2_name_input]
	erb :secret_word, :locals => {:p1 => backend_p1_name, :p2 => backend_p2_name}
end

get '/secret_word' do
	backend_p1_name = params[:backend_p1_name]
	backend_p2_name = params[:backend_p2_name]
	erb :secret_word, :locals => {:p1 => backend_p1_name, :p2 => backend_p2_name}
end


post '/secret_word' do
	secret_word = params[:secret_word_input]
	backend_secret_word = Word.new(params[:secret_word_input])
	backend_p1_name = params[:p1_name_input]
	backend_p2_name = params[:p2_name_input]
	underscores = secret_word.gsub(/[abcdefghijklmnopqrstuvwxyz]/, '_ ')
	underscores.chars
	countdown = 6

		if backend_secret_word.valid_input? == false
			redirect '/secret_word?backend_p1_name=' + backend_p1_name + '&backend_p2_name=' + backend_p2_name
		end

	erb :guess, :locals => {:countdown => countdown, :underscores => underscores, :secret => backend_secret_word, :p1 => backend_p1_name, :p2 => backend_p2_name}
end


# post '/guess' do

# 		if letter_guess?()



	









