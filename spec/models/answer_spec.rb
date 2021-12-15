# == Schema Information
#
# Table name: answers
#
#  id            :bigint           not null, primary key
#  answer_status :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  audit_id      :bigint
#  question_id   :bigint
#
# Indexes
#
#  index_answers_on_audit_id     (audit_id)
#  index_answers_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (audit_id => audits.id)
#  fk_rails_...  (question_id => questions.id)
#
require 'rails_helper'

RSpec.describe Answer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
