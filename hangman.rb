class Word
# 6 incorrect = lose

	attr_accessor :secret_word, :underscores, :wrong, :already

	def initialize(word)
		@secret_word = word
		@underscores = underscores_function
		@wrong = 6
		@already = []

	end

	def already_guessed(guess)
		already << guess
	end

	def underscores_function
		underscores_function = Array.new(secret_word.length, '_ ')
	end


	def valid_input?
		secret_word[/[a-zA-Z]+/]  == secret_word	
	end


	def letter_guess?(guess)
		secret_word.include?(guess)
	end


	def win?(guesses)
		results = false
		correct = 0

		guesses.each do |guess|

			if letter_guess?(guess)
				correct += 1
				if correct == secret_word.length
					results = true
				end
			end
		end
		results
	end

	#dont combine win and lose because we want false if not yet a win, but that doesnt mean game over

	def lose?(guesses)
		results = false
		incorrect = 0
		guesses.each do |guess|

			if letter_guess?(guess) == false
				incorrect += 1
				if incorrect == 6
					results = true #true that they lose
				end
			end
		end
		results
	end


	def guess_letter(guess)

		if secret_word.include?(guess)

			secret_word.each_char.with_index do |val, pos|
				if val == guess
					@underscores[pos] = val
				end
			end
		else
			@wrong -= 1
		end

	end



	def find_pos(guess)


	word_array = secret_word.chars

	index_array = word_array.each_index.select{|i| word_array[i] == guess}

		# result = secret_word.gsub(/[abcdefghijklmnopqrstuvwxyz]/, '_')
	end



end