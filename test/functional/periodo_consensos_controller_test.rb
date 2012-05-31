require 'test_helper'

class PeriodoConsensosControllerTest < ActionController::TestCase
  setup do
    @periodo_consenso = periodo_consensos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:periodo_consensos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create periodo_consenso" do
    assert_difference('PeriodoConsenso.count') do
      post :create, :periodo_consenso => @periodo_consenso.attributes
    end

    assert_redirected_to periodo_consenso_path(assigns(:periodo_consenso))
  end

  test "should show periodo_consenso" do
    get :show, :id => @periodo_consenso.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @periodo_consenso.to_param
    assert_response :success
  end

  test "should update periodo_consenso" do
    put :update, :id => @periodo_consenso.to_param, :periodo_consenso => @periodo_consenso.attributes
    assert_redirected_to periodo_consenso_path(assigns(:periodo_consenso))
  end

  test "should destroy periodo_consenso" do
    assert_difference('PeriodoConsenso.count', -1) do
      delete :destroy, :id => @periodo_consenso.to_param
    end

    assert_redirected_to periodo_consensos_path
  end
end
