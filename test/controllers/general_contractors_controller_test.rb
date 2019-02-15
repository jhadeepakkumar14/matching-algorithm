require 'test_helper'

class GeneralContractorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get general_contractors_index_url
    assert_response :success
  end

  test "should get new" do
    get general_contractors_new_url
    assert_response :success
  end

  test "should get create" do
    get general_contractors_create_url
    assert_response :success
  end

  test "should get show" do
    get general_contractors_show_url
    assert_response :success
  end

  test "should get edit" do
    get general_contractors_edit_url
    assert_response :success
  end

  test "should get update" do
    get general_contractors_update_url
    assert_response :success
  end

  test "should get destroy" do
    get general_contractors_destroy_url
    assert_response :success
  end

end
