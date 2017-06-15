require './test/test_helper'
require './lib/card_generator'

class ClassGeneratorTest < Minitest::Test

  def test_it_exists
    card_gen = CardGenerator.new("./cards.txt")

    assert_instance_of CardGenerator, card_gen
  end

  def test_it_can_load_file
    card_gen = CardGenerator.new("./cards.txt")

    assert File.exists?("./cards.txt")
  end

  def test_it_can_count_cards
    card_gen = CardGenerator.new("./cards.txt")

    assert_equal 4, card_gen.cards.count
  end

  def test_it_holds_cards
    card_gen = CardGenerator.new("./cards.txt")
    
    assert_instance_of Array, card_gen.cards
    assert_instance_of Card, card_gen.cards[2]
  end
end
