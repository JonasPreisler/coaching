require 'test_helper'

class TutorsDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tutors_document = tutors_documents(:one)
  end

  test "should get index" do
    get tutors_documents_url
    assert_response :success
  end

  test "should get new" do
    get new_tutors_document_url
    assert_response :success
  end

  test "should create tutors_document" do
    assert_difference('TutorsDocument.count') do
      post tutors_documents_url, params: { tutors_document: { document_id: @tutors_document.document_id, tutor_id: @tutors_document.tutor_id } }
    end

    assert_redirected_to tutors_document_url(TutorsDocument.last)
  end

  test "should show tutors_document" do
    get tutors_document_url(@tutors_document)
    assert_response :success
  end

  test "should get edit" do
    get edit_tutors_document_url(@tutors_document)
    assert_response :success
  end

  test "should update tutors_document" do
    patch tutors_document_url(@tutors_document), params: { tutors_document: { document_id: @tutors_document.document_id, tutor_id: @tutors_document.tutor_id } }
    assert_redirected_to tutors_document_url(@tutors_document)
  end

  test "should destroy tutors_document" do
    assert_difference('TutorsDocument.count', -1) do
      delete tutors_document_url(@tutors_document)
    end

    assert_redirected_to tutors_documents_url
  end
end
