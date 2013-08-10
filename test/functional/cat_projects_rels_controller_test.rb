require 'test_helper'

class CatProjectsRelsControllerTest < ActionController::TestCase
  setup do
    @cat_projects_rel = cat_projects_rels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cat_projects_rels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cat_projects_rel" do
    assert_difference('CatProjectsRel.count') do
      post :create, cat_projects_rel: { kick_category_id: @cat_projects_rel.kick_category_id, kick_project_id: @cat_projects_rel.kick_project_id }
    end

    assert_redirected_to cat_projects_rel_path(assigns(:cat_projects_rel))
  end

  test "should show cat_projects_rel" do
    get :show, id: @cat_projects_rel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cat_projects_rel
    assert_response :success
  end

  test "should update cat_projects_rel" do
    put :update, id: @cat_projects_rel, cat_projects_rel: { kick_category_id: @cat_projects_rel.kick_category_id, kick_project_id: @cat_projects_rel.kick_project_id }
    assert_redirected_to cat_projects_rel_path(assigns(:cat_projects_rel))
  end

  test "should destroy cat_projects_rel" do
    assert_difference('CatProjectsRel.count', -1) do
      delete :destroy, id: @cat_projects_rel
    end

    assert_redirected_to cat_projects_rels_path
  end
end
