require "application_system_test_case"

class ActiveHoursTest < ApplicationSystemTestCase
  setup do
    @active_hour = active_hours(:one)
  end

  test "visiting the index" do
    visit active_hours_url
    assert_selector "h1", text: "active Hours"
  end

  test "creating a active hour" do
    visit active_hours_url
    click_on "New active Hour"

    fill_in "From", with: @active_hour.from
    fill_in "To", with: @active_hour.to
    fill_in "Tutor", with: @active_hour.tutor_id
    click_on "Create active hour"

    assert_text "active hour was successfully created"
    click_on "Back"
  end

  test "updating a active hour" do
    visit active_hours_url
    click_on "Edit", match: :first

    fill_in "From", with: @active_hour.from
    fill_in "To", with: @active_hour.to
    fill_in "Tutor", with: @active_hour.tutor_id
    click_on "Update active hour"

    assert_text "active hour was successfully updated"
    click_on "Back"
  end

  test "destroying a active hour" do
    visit active_hours_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "active hour was successfully destroyed"
  end
end
