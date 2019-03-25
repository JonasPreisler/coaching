require 'test_helper'

class ActiveHoursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @active_hour = active_hours(:one)
  end

  test "should get index" do
    get active_hours_url
    assert_response :success
  end

  test "should get new" do
    get new_active_hour_url
    assert_response :success
  end

  test "should create active_hour" do
    assert_difference('ActiveHour.count') do
      post active_hours_url, params: { active_hour: { from: @active_hour.from, to: @active_hour.to, tutor_id: @active_hour.tutor_id } }
    end

    assert_redirected_to active_hour_url(ActiveHour.last)
  end

  test "should show active_hour" do
    get active_hour_url(@active_hour)
    assert_response :success
  end

  test "should get edit" do
    get edit_active_hour_url(@active_hour)
    assert_response :success
  end

  test "should update active_hour" do
    patch active_hour_url(@active_hour), params: { active_hour: { from: @active_hour.from, to: @active_hour.to, tutor_id: @active_hour.tutor_id } }
    assert_redirected_to active_hour_url(@active_hour)
  end

  test "should destroy active_hour" do
    assert_difference('ActiveHour.count', -1) do
      delete active_hour_url(@active_hour)
    end

    assert_redirected_to active_hours_url
  end
end
