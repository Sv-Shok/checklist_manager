class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :checklist, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
