class Word


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

end