require "./lib/card"
require "./lib/deck"
require "./lib/guess"
class Round

attr_reader :deck,
            :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []

  end

  def current_card
    deck.cards[0]
  end

  def record_guess(answer)
    guess = Guess.new(answer, current_card)
    @guesses << guess
    guess
  end

  def number_correct
    correct_guesses = guesses.map do |guess|
      guess.feedback == "Correct!"
    end
    correct_guesses.length
  end
end
