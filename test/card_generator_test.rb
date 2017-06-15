require './test/test_helper'
require './lib/card_generator'

class ClassGeneratorTest < Minitest::Test


  def test_it_exists
    card_gen = CardGenerator.new("./cards.txt")
    assert_instance_of CardGenerator, card_gen
  end
end
