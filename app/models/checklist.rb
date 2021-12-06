# == Schema Information
#
# Table name: checklists
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Checklist < ApplicationRecord
  validates :title, presence: true, length: { in: 4..40 }
  validates :description, presence: true, length: { in: 4..40 }    
end