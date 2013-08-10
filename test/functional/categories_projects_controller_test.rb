require 'test_helper'

class CategoriesProjectsControllerTest < ActionController::TestCase
  setup do
    @categories_project = categories_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create categories_project" do
    assert_difference('CategoriesProjects.count') do
      post :create, categories_project: { kick_category_id: @categories_project.kick_category_id, kick_project_id: @categories_project.kick_project_id }
    end

    assert_redirected_to categories_project_path(assigns(:categories_project))
  end

  test "should show categories_project" do
    get :show, id: @categories_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @categories_project
    assert_response :success
  end

  test "should update categories_project" do
    put :update, id: @categories_project, categories_project: { kick_category_id: @categories_project.kick_category_id, kick_project_id: @categories_project.kick_project_id }
    assert_redirected_to categories_project_path(assigns(:categories_project))
  end

  test "should destroy categories_project" do
    assert_difference('CategoriesProjects.count', -1) do
      delete :destroy, id: @categories_project
    end

    assert_redirected_to categories_projects_index_path
  end
end
