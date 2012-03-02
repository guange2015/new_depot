require 'test_helper'

class FireworkTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: fireworks
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  spec       :integer
#  lastdata   :integer         default(0)
#  created_at :datetime
#  updated_at :datetime
#  comment    :string(60)
#

