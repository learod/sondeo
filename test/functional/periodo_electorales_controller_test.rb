require 'test_helper'

class PeriodoElectoralesControllerTest < ActionController::TestCase
  setup do
    @periodo_electoral = periodo_electorales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:periodo_electorales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create periodo_electoral" do
    assert_difference('PeriodoElectoral.count') do
      post :create, :periodo_electoral => @periodo_electoral.attributes
    end

    assert_redirected_to periodo_electoral_path(assigns(:periodo_electoral))
  end

  test "should show periodo_electoral" do
    get :show, :id => @periodo_electoral.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @periodo_electoral.to_param
    assert_response :success
  end

  test "should update periodo_electoral" do
    put :update, :id => @periodo_electoral.to_param, :periodo_electoral => @periodo_electoral.attributes
    assert_redirected_to periodo_electoral_path(assigns(:periodo_electoral))
  end

  test "should destroy periodo_electoral" do
    assert_difference('PeriodoElectoral.count', -1) do
      delete :destroy, :id => @periodo_electoral.to_param
    end

    assert_redirected_to periodo_electorales_path
  end
end
