require './test/test_helper'
require './lib/guess'
class GuessTest < MiniTest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_instance_of Guess, guess
  end


  def test_it_is_correct
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_instance_of Card, guess.card
    assert_equal "Juneau", guess.response
    assert guess.correct?
  end

  def test_it_is_false
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Taco", card)
    assert_instance_of Card, guess.card
    assert_equal "Taco", guess.response
    refute guess.correct?
  end

  def test_response_correct_if_correct
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert guess.correct?
    assert_equal "Correct!", guess.feedback
  end

  def test_response_incorrect_if_false
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Taco", card)
    assert_equal "Incorrect.", guess.feedback
  end
end
