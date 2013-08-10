require 'test_helper'

class KickProjectsControllerTest < ActionController::TestCase
  setup do
    @kick_project = kick_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kick_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kick_project" do
    assert_difference('KickProject.count') do
      post :create, kick_project: { expiration_date: @kick_project.expiration_date, id: @kick_project.id, kick_category_id: @kick_project.kick_category_id, name: @kick_project.name }
    end

    assert_redirected_to kick_project_path(assigns(:kick_project))
  end

  test "should show kick_project" do
    get :show, id: @kick_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kick_project
    assert_response :success
  end

  test "should update kick_project" do
    put :update, id: @kick_project, kick_project: { expiration_date: @kick_project.expiration_date, id: @kick_project.id, kick_category_id: @kick_project.kick_category_id, name: @kick_project.name }
    assert_redirected_to kick_project_path(assigns(:kick_project))
  end

  test "should destroy kick_project" do
    assert_difference('KickProject.count', -1) do
      delete :destroy, id: @kick_project
    end

    assert_redirected_to kick_projects_path
  end
end
