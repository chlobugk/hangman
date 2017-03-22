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

	 def test_wrong_letter_guess_false
	 	word = Word.new('box')
	 	guess = 'a'
	 	assert_equal(false, word.letter_guess?(guess))
	 end

	 def test_correct_letter_guess_true
	 	word = Word.new('box')
	 	guess = 'o'
	 	assert_equal(true, word.letter_guess?(guess))
	 end

	 def test_incorrect_number_guess_false
	 	word = Word.new('box')
	 	guess = '3'
	 	assert_equal(false, word.letter_guess?(guess))
	 end

	 def test_win_with_3_guesses
	 	word = Word.new('box')
	 	guesses = ['b', 'o', 'x']
	 	assert_equal(true, word.win?(guesses))
	 end

	 def test_win_with_3_guesses
	 	word = Word.new('box')
	 	guesses = ['b', 'o', 'x']
	 	assert_equal(true, word.win?(guesses))
	 end

	 def test_no_win_with_3_guesses
	 	word = Word.new('box')
	 	guesses = ['b', 'o', 'y']
	 	assert_equal(false, word.win?(guesses))
	 end

	 def test_win_with_4_guesses
	 	word = Word.new('box')
	 	guesses = ['b', 'o', 'y', 'x']
	 	assert_equal(true, word.win?(guesses))
	 end

	 def test_lose_with_6_incorrect_guesses
	 	word = Word.new('box')
	 	guesses = ['a', 'e', 's', 't', 'i', 'z']
	 	assert_equal(true, word.lose?(guesses))
	 end

	 def test_lose_with_8_guesses
	 	word = Word.new('box')
	 	guesses = ['a', 'e', 'b', 's', 't', 'i', 'o', 'y']
	 	assert_equal(true, word.lose?(guesses))
	 end

	 def test_win_with_8_guesses
	 	word = Word.new('box')
	 	guesses = ['a', 'e', 'b', 's', 't', 'i', 'o', 'x']
	 	assert_equal(false, word.lose?(guesses)) #false that they lose (they win)
	 end

	 def test_get_pos_1
	 	word = Word.new('box')
	 	guess = 'o'
	 	assert_equal([1], word.find_pos(guess))
	 end

	 def test_get_2_letters
	 	word = Word.new('food')
	 	guess = 'o'
	 	assert_equal([1, 2], word.find_pos(guess))
	 end

	 def test_no_letters
	 	word = Word.new('food')
	 	guess = 'a'
	 	assert_equal([], word.find_pos(guess))
	 end

	 def test_get_pos_7_with_t
	 	word = Word.new('chocolate')
	 	guess = 't'
	 	assert_equal([7], word.find_pos(guess))
	 end

end
