require 'test_helper'

class VmTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @vm = @user.vms.build(name: "debian", user_id: @user.id)
  end

  test "should be valid" do
    assert @vm.valid?
  end

  test "user id should be present" do
    @vm.user_id = nil
    assert_not @vm.valid?
  end

end
