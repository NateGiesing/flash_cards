require "./lib/card"
class CardGenerator
  attr_reader :cards

  def initialize(filename)
    @cards = []
    read_cards(filename)
  end

  def read_cards(filename)
    File.foreach filename do |line|
      card = line.chomp.split(",")
      cards << Card.new(card[0], card[1])
    end
  end
end
