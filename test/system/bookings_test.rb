require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @booking = bookings(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Bookings"
  end

  test "creating a Booking" do
    visit orders_url
    click_on "New Booking"

    fill_in "Account", with: @booking.account_id
    fill_in "Booking", with: @booking.booking
    fill_in "Offer", with: @booking.offer_id
    fill_in "Tutor", with: @booking.tutor_id
    click_on "Create Booking"

    assert_text "Booking was successfully created"
    click_on "Back"
  end

  test "updating a Booking" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Account", with: @booking.account_id
    fill_in "Booking", with: @booking.booking
    fill_in "Offer", with: @booking.offer_id
    fill_in "Tutor", with: @booking.tutor_id
    click_on "Update Booking"

    assert_text "Booking was successfully updated"
    click_on "Back"
  end

  test "destroying a Booking" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Booking was successfully destroyed"
  end
end
