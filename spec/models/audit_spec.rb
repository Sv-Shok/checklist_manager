# == Schema Information
#
# Table name: audits
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  checklist_id :bigint
#  user_id      :integer
#
# Indexes
#
#  index_audits_on_checklist_id  (checklist_id)
#
# Foreign Keys
#
#  fk_rails_...  (checklist_id => checklists.id)
#
require 'rails_helper'

RSpec.describe Audit, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
