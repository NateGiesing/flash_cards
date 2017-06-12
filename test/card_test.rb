require './test/test_helper'
require './lib/card'
class CardTest < MiniTest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert_instance_of Card, card
  end


end
