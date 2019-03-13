require "application_system_test_case"

class TutorsCategoriesTest < ApplicationSystemTestCase
  setup do
    @tutors_category = tutors_categories(:one)
  end

  test "visiting the index" do
    visit tutors_categories_url
    assert_selector "h1", text: "Tutors Categories"
  end

  test "creating a Tutors category" do
    visit tutors_categories_url
    click_on "New Tutors Category"

    fill_in "Sub category", with: @tutors_category.sub_category_id
    fill_in "Tutor", with: @tutors_category.tutor_id
    click_on "Create Tutors category"

    assert_text "Tutors category was successfully created"
    click_on "Back"
  end

  test "updating a Tutors category" do
    visit tutors_categories_url
    click_on "Edit", match: :first

    fill_in "Sub category", with: @tutors_category.sub_category_id
    fill_in "Tutor", with: @tutors_category.tutor_id
    click_on "Update Tutors category"

    assert_text "Tutors category was successfully updated"
    click_on "Back"
  end

  test "destroying a Tutors category" do
    visit tutors_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tutors category was successfully destroyed"
  end
end
