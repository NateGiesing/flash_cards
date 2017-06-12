class Card
  attr_reader :question, :answer

  def initialize(question, answer)
    @question = "What is the capital of Alaska?"
    @answer = "Juneau"
  end
end
