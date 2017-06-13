require "./lib/card"
class Guess

  attr_reader :card,
              :response

  def initialize(response, card)
    @response = response
    @card     = card
    require "pry"; binding.pry

  end

  def correct?
    response == card.answer
  end

end
