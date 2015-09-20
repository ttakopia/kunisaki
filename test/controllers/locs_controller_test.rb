require 'test_helper'

class LocsControllerTest < ActionController::TestCase
  setup do
    @loc = locs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loc" do
    assert_difference('Loc.count') do
      post :create, loc: {  }
    end

    assert_redirected_to loc_path(assigns(:loc))
  end

  test "should show loc" do
    get :show, id: @loc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @loc
    assert_response :success
  end

  test "should update loc" do
    patch :update, id: @loc, loc: {  }
    assert_redirected_to loc_path(assigns(:loc))
  end

  test "should destroy loc" do
    assert_difference('Loc.count', -1) do
      delete :destroy, id: @loc
    end

    assert_redirected_to locs_path
  end
end
