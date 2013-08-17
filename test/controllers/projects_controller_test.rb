require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: {category_id: @project.category_id, expiration_date: @project.expiration_date, kick_id: @project.kick_id, name: @project.name, picture_link: @project.picture_link, project_link: @project.project_link, status_id: @project.status_id, video_link: @project.video_link}
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    patch :update, id: @project, project: {category_id: @project.category_id, expiration_date: @project.expiration_date, kick_id: @project.kick_id, name: @project.name, picture_link: @project.picture_link, project_link: @project.project_link, status_id: @project.status_id, video_link: @project.video_link}
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end
end
