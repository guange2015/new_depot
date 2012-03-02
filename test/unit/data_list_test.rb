require 'test_helper'

class DataListTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: data_lists
#
#  id           :integer         not null, primary key
#  data_form_id :integer
#  firework_id  :integer
#  data_number  :integer
#  last_data    :integer
#  s_type       :integer
#  state        :integer         default(1)
#  created_at   :datetime
#  updated_at   :datetime
#  before_data  :integer
#

