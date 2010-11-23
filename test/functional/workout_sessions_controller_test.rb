require 'test_helper'

class WorkoutSessionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workout_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create workout_session" do
    assert_difference('WorkoutSession.count') do
      post :create, :workout_session => { }
    end

    assert_redirected_to workout_session_path(assigns(:workout_session))
  end

  test "should show workout_session" do
    get :show, :id => workout_sessions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => workout_sessions(:one).to_param
    assert_response :success
  end

  test "should update workout_session" do
    put :update, :id => workout_sessions(:one).to_param, :workout_session => { }
    assert_redirected_to workout_session_path(assigns(:workout_session))
  end

  test "should destroy workout_session" do
    assert_difference('WorkoutSession.count', -1) do
      delete :destroy, :id => workout_sessions(:one).to_param
    end

    assert_redirected_to workout_sessions_path
  end
end
