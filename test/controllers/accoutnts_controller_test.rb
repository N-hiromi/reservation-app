require 'test_helper'

class AccoutntsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get accoutnts_show_url
    assert_response :success
  end

  test "should get edit" do
    get accoutnts_edit_url
    assert_response :success
  end

  test "should get update" do
    get accoutnts_update_url
    assert_response :success
  end

end
