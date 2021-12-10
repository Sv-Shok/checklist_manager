# == Schema Information
#
# Table name: questions
#
#  id           :bigint           not null, primary key
#  description  :text
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  checklist_id :bigint
#
# Indexes
#
#  index_questions_on_checklist_id  (checklist_id)
#
# Foreign Keys
#
#  fk_rails_...  (checklist_id => checklists.id)
#
class Question < ApplicationRecord
  validates :title, presence: true, length: { in: 12..40 }
  validates :description, presence: true   

  belongs_to :checklist, optional: true   
end
