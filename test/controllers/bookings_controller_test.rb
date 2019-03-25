require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking = bookings(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create booking" do
    assert_difference('Booking.count') do
      post orders_url, params: { booking: { account_id: @booking.account_id, booking: @booking.booking, offer_id: @booking.offer_id, tutor_id: @booking.tutor_id } }
    end

    assert_redirected_to order_url(Booking.last)
  end

  test "should show booking" do
    get order_url(@booking)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@booking)
    assert_response :success
  end

  test "should update booking" do
    patch order_url(@booking), params: { booking: { account_id: @booking.account_id, booking: @booking.booking, offer_id: @booking.offer_id, tutor_id: @booking.tutor_id } }
    assert_redirected_to order_url(@booking)
  end

  test "should destroy booking" do
    assert_difference('Booking.count', -1) do
      delete order_url(@booking)
    end

    assert_redirected_to orders_url
  end
end
