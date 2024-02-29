require "test_helper"

class Driver::CompetitionEntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get driver_competition_entries_index_url
    assert_response :success
  end

  test "should get show" do
    get driver_competition_entries_show_url
    assert_response :success
  end

  test "should get new" do
    get driver_competition_entries_new_url
    assert_response :success
  end

  test "should get edit" do
    get driver_competition_entries_edit_url
    assert_response :success
  end

  test "should get create" do
    get driver_competition_entries_create_url
    assert_response :success
  end

  test "should get update" do
    get driver_competition_entries_update_url
    assert_response :success
  end

  test "should get destroy" do
    get driver_competition_entries_destroy_url
    assert_response :success
  end
end
