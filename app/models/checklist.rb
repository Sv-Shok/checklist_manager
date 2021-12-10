# == Schema Information
#
# Table name: checklists
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
class Checklist < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy
  
  accepts_nested_attributes_for :questions, allow_destroy: true, reject_if: :all_blank

  validates :title, presence: true, length: { in: 4..40 }
  validates :description, presence: true, length: { in: 4..40 }    
end
