require "test_helper"

class Driver::CompetitionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get driver_competitions_index_url
    assert_response :success
  end

  test "should get show" do
    get driver_competitions_show_url
    assert_response :success
  end
end
