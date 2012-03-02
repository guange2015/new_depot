require 'test_helper'

class DataFormTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: data_forms
#
#  id         :integer         not null, primary key
#  comment    :string(255)
#  s_type     :integer
#  state      :integer         default(1)
#  created_at :datetime
#  updated_at :datetime
#

