module AuditsHelper
  def getQuestion(questions, id)
    questions.select { |question| question["id"] == id }[0]
  end

  def format_date(value)
    value.try(:strftime, "%d.%m.%Y | %T")
  end
end
