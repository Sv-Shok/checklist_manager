class AddAnswerToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :answer, :integer
  end
end
