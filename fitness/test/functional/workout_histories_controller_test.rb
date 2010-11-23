require 'test_helper'

class WorkoutHistoriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workout_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create workout_history" do
    assert_difference('WorkoutHistory.count') do
      post :create, :workout_history => { }
    end

    assert_redirected_to workout_history_path(assigns(:workout_history))
  end

  test "should show workout_history" do
    get :show, :id => workout_histories(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => workout_histories(:one).to_param
    assert_response :success
  end

  test "should update workout_history" do
    put :update, :id => workout_histories(:one).to_param, :workout_history => { }
    assert_redirected_to workout_history_path(assigns(:workout_history))
  end

  test "should destroy workout_history" do
    assert_difference('WorkoutHistory.count', -1) do
      delete :destroy, :id => workout_histories(:one).to_param
    end

    assert_redirected_to workout_histories_path
  end
end
