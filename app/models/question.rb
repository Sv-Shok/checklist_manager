# == Schema Information
#
# Table name: questions
#
#  id           :bigint           not null, primary key
#  answer       :integer
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
  belongs_to :checklist, optional: true 
  belongs_to :audit, optional: true
  has_many :answers, dependent: :destroy   
  
  validates :title, presence: true, length: { in: 12..40 }
  validates :description, presence: true   
end
