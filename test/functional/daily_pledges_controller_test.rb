require 'test_helper'

class DailyPledgesControllerTest < ActionController::TestCase
  setup do
    @daily_pledge = daily_pledges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:daily_pledges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create daily_pledge" do
    assert_difference('DailyPledge.count') do
      post :create, daily_pledge: { amount_bakcers: @daily_pledge.amount_bakcers, amount_pledges: @daily_pledge.amount_pledges, kick_project_id: @daily_pledge.kick_project_id, pledge_id: @daily_pledge.pledge_id, push_date: @daily_pledge.push_date }
    end

    assert_redirected_to daily_pledge_path(assigns(:daily_pledge))
  end

  test "should show daily_pledge" do
    get :show, id: @daily_pledge
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @daily_pledge
    assert_response :success
  end

  test "should update daily_pledge" do
    put :update, id: @daily_pledge, daily_pledge: { amount_bakcers: @daily_pledge.amount_bakcers, amount_pledges: @daily_pledge.amount_pledges, kick_project_id: @daily_pledge.kick_project_id, pledge_id: @daily_pledge.pledge_id, push_date: @daily_pledge.push_date }
    assert_redirected_to daily_pledge_path(assigns(:daily_pledge))
  end

  test "should destroy daily_pledge" do
    assert_difference('DailyPledge.count', -1) do
      delete :destroy, id: @daily_pledge
    end

    assert_redirected_to daily_pledges_path
  end
end
