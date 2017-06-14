require "./lib/card"
require "./lib/deck"
require "./lib/guess"
class Round

attr_reader :deck,
            :guesses,
            :index

  def initialize(deck)
    @deck = deck
    @guesses = []
    @index   = 0
  end

  def current_card
    deck.cards[index]
  end

  def record_guess(answer)
    guess = Guess.new(answer, current_card)
    @index += 1
    @guesses << guess
    guess
  end

  def number_correct
    correct_guesses = guesses.select do |guess|
      guess.feedback == "Correct!"
    end
    correct_guesses.length
  end

  def percent_correct
    (number_correct.to_f / guesses.count.to_f) * 100
  end
end
