require 'minitest/autorun'
require_relative 'hangman.rb'

class TestHangman < MiniTest::Test 

	 def test_get_length
	 	word = Word.new('chocolate')
	 	assert_equal(9, word.secret_word.length)
	 end

	 def test_valid_input_chocolate
	 	word = Word.new('chocolate')
	 	assert_equal(true, word.valid_input?)
	 end

	 def test_invalid_input_chocolate_with_zeros
	 	word = Word.new('ch0c0late')
	 	assert_equal(false, word.valid_input?)
	 end

	 def test_invalid_input_chocolate_with_at_sign
	 	word = Word.new('chocol@te')
	 	assert_equal(false, word.valid_input?)
	 end

	 # def test_wrong_letter_guess_false
	 # 	word = Word.new('box')

end
