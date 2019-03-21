require "application_system_test_case"

class AvailableHoursTest < ApplicationSystemTestCase
  setup do
    @available_hour = available_hours(:one)
  end

  test "visiting the index" do
    visit available_hours_url
    assert_selector "h1", text: "Available Hours"
  end

  test "creating a Available hour" do
    visit available_hours_url
    click_on "New Available Hour"

    fill_in "From", with: @available_hour.from
    fill_in "To", with: @available_hour.to
    fill_in "Tutor", with: @available_hour.tutor_id
    click_on "Create Available hour"

    assert_text "Available hour was successfully created"
    click_on "Back"
  end

  test "updating a Available hour" do
    visit available_hours_url
    click_on "Edit", match: :first

    fill_in "From", with: @available_hour.from
    fill_in "To", with: @available_hour.to
    fill_in "Tutor", with: @available_hour.tutor_id
    click_on "Update Available hour"

    assert_text "Available hour was successfully updated"
    click_on "Back"
  end

  test "destroying a Available hour" do
    visit available_hours_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Available hour was successfully destroyed"
  end
end
