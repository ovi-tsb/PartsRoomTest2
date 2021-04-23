require "test_helper"

class UsePartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get use_parts_index_url
    assert_response :success
  end

  test "should get edit" do
    get use_parts_edit_url
    assert_response :success
  end

  test "should get update" do
    get use_parts_update_url
    assert_response :success
  end

  test "should get show" do
    get use_parts_show_url
    assert_response :success
  end

  test "should get new" do
    get use_parts_new_url
    assert_response :success
  end
end
