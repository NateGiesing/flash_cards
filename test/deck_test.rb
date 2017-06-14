require './test/test_helper'
require './lib/deck'

class DeckTest < MiniTest::Test

  def test_it_exists
    deck = Deck.new("a")
    assert_instance_of Deck, deck
  end

  def test_it_can_store_cards
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    deck = Deck.new([card_1])
    assert_equal [card_1], deck.cards
  end

  def test_it_can_store_more_then_one_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
    deck   = Deck.new([card_1, card_2, card_3])
    assert_equal [card_1, card_2, card_3], deck.cards
    assert_instance_of Array, deck.cards
  end
end
