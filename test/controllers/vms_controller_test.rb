require 'test_helper'

class VmsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @vm = vms(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Vm.count' do
      post vms_path, params: { vm: { name: "debian" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Vm.count' do
      delete vm_path(@vm)
    end
    assert_redirected_to login_url
  end
end
