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

end
