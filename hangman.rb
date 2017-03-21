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


# incorrect += 1
# 				if incorrect == 6
# 					results = false
# 				end


end