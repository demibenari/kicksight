require 'test_helper'

class KickCategoriesControllerTest < ActionController::TestCase
  setup do
    @kick_category = kick_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kick_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kick_category" do
    assert_difference('KickCategory.count') do
      post :create, kick_category: { description: @kick_category.description, id: @kick_category.id }
    end

    assert_redirected_to kick_category_path(assigns(:kick_category))
  end

  test "should show kick_category" do
    get :show, id: @kick_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kick_category
    assert_response :success
  end

  test "should update kick_category" do
    put :update, id: @kick_category, kick_category: { description: @kick_category.description, id: @kick_category.id }
    assert_redirected_to kick_category_path(assigns(:kick_category))
  end

  test "should destroy kick_category" do
    assert_difference('KickCategory.count', -1) do
      delete :destroy, id: @kick_category
    end

    assert_redirected_to kick_categories_path
  end
end
