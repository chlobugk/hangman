class Word
# 6 incorrect = lose

	attr_accessor :secret_word

	def initialize(word)
		@secret_word = word
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


end