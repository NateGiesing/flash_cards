require "./lib/card"
require "./lib/deck"
require "./lib/guess"
class Round

attr_reader :deck,
            :guesses,
            :index

  def initialize(deck)
    @deck    = deck
    @guesses = []
    @index   = 0
  end

  def start
    puts "Welcome! You are playing with #{deck.cards.length} cards"
    puts "--------------------------------------------------------"
    deck.cards.length.times do
      p "Question: " + current_card.question
      answer = gets.chomp
      record_guess(answer)
      p guesses.last.feedback
    end
    puts "****** Game Over! ******"
    puts "You had #{number_correct} guesses out of #{deck.cards.length} for a score of #{percent_correct} %."
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
