class Word


	attr_accessor :secret_word

	def initialize(word)
		@secret_word = word
	end

	def valid_input?
		if secret_word[/[a-zA-Z]+/]  == secret_word
			true
		else
			false
		end
	end


	
end