# == Schema Information
#
# Table name: audits
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  checklist_id :bigint
#
# Indexes
#
#  index_audits_on_checklist_id  (checklist_id)
#
# Foreign Keys
#
#  fk_rails_...  (checklist_id => checklists.id)
#
class Audit < ApplicationRecord
  belongs_to :checklist
  has_many :questions
  accepts_nested_attributes_for :questions  
end
