class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :audit, foreign_key: true
      t.references :question, foreign_key: true
      t.integer :answer_status

      t.timestamps
    end
  end
end
