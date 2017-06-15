require "./lib/card"
class Guess

  attr_reader :card,
              :response

  def initialize(response, card)
    @response = response
    @card     = card
  end

  def correct?
    response.downcase == card.answer.downcase
  end

  def feedback
    if correct? == true
      "Correct!"
    else
      "Incorrect."
    end
  end

end
