require 'test_helper'

class TutorsCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tutors_category = tutors_categories(:one)
  end

  test "should get index" do
    get tutors_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_tutors_category_url
    assert_response :success
  end

  test "should create tutors_category" do
    assert_difference('TutorsCategory.count') do
      post tutors_categories_url, params: { tutors_category: { sub_category_id: @tutors_category.sub_category_id, tutor_id: @tutors_category.tutor_id } }
    end

    assert_redirected_to tutors_category_url(TutorsCategory.last)
  end

  test "should show tutors_category" do
    get tutors_category_url(@tutors_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_tutors_category_url(@tutors_category)
    assert_response :success
  end

  test "should update tutors_category" do
    patch tutors_category_url(@tutors_category), params: { tutors_category: { sub_category_id: @tutors_category.sub_category_id, tutor_id: @tutors_category.tutor_id } }
    assert_redirected_to tutors_category_url(@tutors_category)
  end

  test "should destroy tutors_category" do
    assert_difference('TutorsCategory.count', -1) do
      delete tutors_category_url(@tutors_category)
    end

    assert_redirected_to tutors_categories_url
  end
end
