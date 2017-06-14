require './test/test_helper'
require './lib/round'

class RoundTest < MiniTest::Test

  def test_it_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)

    assert_instance_of Round, round
  end

  def test_it_has_a_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)

    assert_instance_of Deck, round.deck
    assert_equal 2, round.deck.count
  end

  def test_it_has_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)

    assert_equal [], round.guesses
  end

  def test_current_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)

    assert_equal "Juneau", round.current_card.answer
  end

  def test_it_can_record_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)

    assert_instance_of Guess, round.record_guess("Juneau")
    assert_equal 1, round.guesses.count
    assert_equal "Correct!", round.guesses.first.feedback
  end

  def test_correct_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)

    assert_equal "Juneau", round.current_card.answer
    assert_instance_of Guess, round.record_guess("Juneau")
    assert_equal "Correct!", round.guesses.first.feedback
    assert_equal 1, round.number_correct
    assert_equal "Mars", round.current_card.answer

    round.record_guess("wrong answer")
    assert_equal 2, round.guesses.count
    assert_equal 2, round.index
    assert_equal "Incorrect.", round.guesses.last.feedback
    assert_equal 1, round.number_correct
    assert_equal 50, round.percent_correct
  end




end
