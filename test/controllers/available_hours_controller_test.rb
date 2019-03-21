require 'test_helper'

class AvailableHoursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @available_hour = available_hours(:one)
  end

  test "should get index" do
    get available_hours_url
    assert_response :success
  end

  test "should get new" do
    get new_available_hour_url
    assert_response :success
  end

  test "should create available_hour" do
    assert_difference('AvailableHour.count') do
      post available_hours_url, params: { available_hour: { from: @available_hour.from, to: @available_hour.to, tutor_id: @available_hour.tutor_id } }
    end

    assert_redirected_to available_hour_url(AvailableHour.last)
  end

  test "should show available_hour" do
    get available_hour_url(@available_hour)
    assert_response :success
  end

  test "should get edit" do
    get edit_available_hour_url(@available_hour)
    assert_response :success
  end

  test "should update available_hour" do
    patch available_hour_url(@available_hour), params: { available_hour: { from: @available_hour.from, to: @available_hour.to, tutor_id: @available_hour.tutor_id } }
    assert_redirected_to available_hour_url(@available_hour)
  end

  test "should destroy available_hour" do
    assert_difference('AvailableHour.count', -1) do
      delete available_hour_url(@available_hour)
    end

    assert_redirected_to available_hours_url
  end
end
