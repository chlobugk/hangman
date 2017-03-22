require 'sinatra'
require_relative 'hangman'

enable :sessions

get '/' do
	erb :names
end

post '/names' do
	session[:p1_name] = params[:p1_name_input]
	session[:p2_name] = params[:p2_name_input]
	erb :secret_word, :locals => {:p1 => session[:p1_name], :p2 => session[:p2_name]}
end

get '/secret_word' do

	erb :secret_word, :locals => {:p1 => session[:p1_name], :p2 => session[:p2_name]}
end


post '/secret_word' do
	secret_word = params[:secret_word_input]
	session[:hangman] = Word.new(params[:secret_word_input])
	session[:underscores] = secret_word.gsub(/[abcdefghijklmnopqrstuvwxyz]/, '_ ')
	session[:underscores].chars

		if session[:hangman].valid_input? == false
			redirect '/secret_word'
		end
		session[:length] = session[:hangman].underscores.count

		redirect '/game'
	
end


get '/game' do
	underscore_letters = session[:hangman].underscores.join
	session[:wrong] = session[:hangman].wrong

		if session[:hangman].wrong == 6
					erb :lose
				
		end
	erb :guess, :locals => {:guess => session[:guess], :wrong => session[:wrong], :underscores => session[:underscores], :secret => session[:hangman], :p1 => session[:p1_name], :p2 => session[:p2_name]}
end



post '/guess' do
	secret_word = params[:secret_word_input]
	session[:guess] = params[:guess_input]

		if session[:hangman].underscores.include?('_')
			redirect '/game'
		else
			erb :win
			# index_array = []
			# word_array = session[:hangman].to_s.chars
			# index_array = word_array.each_index.select{|i| word_array[i] == guess}

			# index_array.each do |ind|
			# 	underscore = session[:underscores]
			# 	underscore[ind] = guess
			# end	
		end

	
end





	









