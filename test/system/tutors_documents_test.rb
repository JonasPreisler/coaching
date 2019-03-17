require "application_system_test_case"

class TutorsDocumentsTest < ApplicationSystemTestCase
  setup do
    @tutors_document = tutors_documents(:one)
  end

  test "visiting the index" do
    visit tutors_documents_url
    assert_selector "h1", text: "Tutors Documents"
  end

  test "creating a Tutors document" do
    visit tutors_documents_url
    click_on "New Tutors Document"

    fill_in "Document", with: @tutors_document.document_id
    fill_in "Tutor", with: @tutors_document.tutor_id
    click_on "Create Tutors document"

    assert_text "Tutors document was successfully created"
    click_on "Back"
  end

  test "updating a Tutors document" do
    visit tutors_documents_url
    click_on "Edit", match: :first

    fill_in "Document", with: @tutors_document.document_id
    fill_in "Tutor", with: @tutors_document.tutor_id
    click_on "Update Tutors document"

    assert_text "Tutors document was successfully updated"
    click_on "Back"
  end

  test "destroying a Tutors document" do
    visit tutors_documents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tutors document was successfully destroyed"
  end
end
