require 'test_helper'

class GovernmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get governments_index_url
    assert_response :success
  end

end
