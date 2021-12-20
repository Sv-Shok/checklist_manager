module AuditsHelper
  def getQuestion(questions, id)
    questions.select { |question| question["id"] == id }[0]
  end      
end
