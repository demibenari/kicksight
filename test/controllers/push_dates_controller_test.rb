require 'test_helper'

class PushDatesControllerTest < ActionController::TestCase
  setup do
    @push_date = push_dates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:push_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create push_date" do
    assert_difference('PushDate.count') do
      post :create, push_date: {push_date: @push_date.push_date}
    end

    assert_redirected_to push_date_path(assigns(:push_date))
  end

  test "should show push_date" do
    get :show, id: @push_date
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @push_date
    assert_response :success
  end

  test "should update push_date" do
    patch :update, id: @push_date, push_date: {push_date: @push_date.push_date}
    assert_redirected_to push_date_path(assigns(:push_date))
  end

  test "should destroy push_date" do
    assert_difference('PushDate.count', -1) do
      delete :destroy, id: @push_date
    end

    assert_redirected_to push_dates_path
  end
end
