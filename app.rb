require 'sinatra'
require_relative 'hangman'

enable :sessions

get '/' do
	session[:image] = nil
	erb :names
end


post '/names' do
	session[:p1_name] = params[:p1_name_input].capitalize
	session[:p2_name] = params[:p2_name_input].capitalize

	if session[:p1_name] == '' || session[:p2_name] == ''
		redirect '/'
	end
	erb :secret_word, :locals => {:p1 => session[:p1_name], :p2 => session[:p2_name]}
end


get '/secret_word' do

	erb :secret_word, :locals => {:p1 => session[:p1_name], :p2 => session[:p2_name]}
end


post '/secret_word' do
	session[:secret_word] = params[:secret_word_input]
	session[:hangman] = Word.new(params[:secret_word_input].upcase)

		if session[:hangman].valid_input? == false
			redirect '/secret_word'
		end

		redirect '/firstguess'
	
end


get '/firstguess' do
	session[:underscores] = session[:hangman].underscores.join
	session[:already] = [].join
	session[:countdown] = session[:hangman].wrong
	session[:image] = '/img/full_rose.png'

		if session[:countdown] == 0
			erb :lose, :locals => {:p1 => session[:p1_name], :p2 => session[:p2_name], :secret => session[:secret_word]}
		else
			erb :guess, :locals => {:image => session[:image], :already => session[:already], :guess => session[:guess], :wrong => session[:countdown], :underscores => session[:underscores], :secret => session[:hangman], :p1 => session[:p1_name], :p2 => session[:p2_name]}
		end
end


get '/game' do
	session[:underscores] = session[:hangman].underscores.join
	session[:already] = session[:hangman].already_guessed(session[:guess]).join(', ')
	session[:countdown] = session[:hangman].wrong
	image_array = ['/img/5_rose.png', '/img/4_rose.png', '/img/3_rose.png', '/img/2_rose.png', '/img/1_rose.png', '/img/full_rose.png']
	session[:image] = image_array[session[:countdown] - 1]


		if session[:countdown] == 0
			erb :lose, :locals => {:p1 => session[:p1_name], :p2 => session[:p2_name], :secret => session[:secret_word]}
		else
			erb :guess, :locals => {:image => session[:image], :already => session[:already], :guess => session[:guess], :wrong => session[:countdown], :underscores => session[:underscores], :secret => session[:hangman], :p1 => session[:p1_name], :p2 => session[:p2_name]}
		end
end


post '/guess' do
	session[:guess] = params[:guess_input]
	session[:hangman].guess_letter(session[:guess])

		if session[:hangman].underscores.include?('_ ')
			redirect '/game' 
		else
			erb :win, :locals => {:p1 => session[:p1_name], :p2 => session[:p2_name]}
		end
			
end





	









