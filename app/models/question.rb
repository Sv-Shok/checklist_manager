# == Schema Information
#
# Table name: questions
#
#  id           :bigint           not null, primary key
#  description  :text
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  checklist_id :integer
#
class Question < ApplicationRecord
  belongs_to :checklist

  validates :title, presence: true, length: { in: 12..40 }
  validates :description, presence: true  
end
