require 'test_helper'

class PeriodoPropuestasControllerTest < ActionController::TestCase
  setup do
    @periodo_propuesta = periodo_propuestas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:periodo_propuestas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create periodo_propuesta" do
    assert_difference('PeriodoPropuesta.count') do
      post :create, :periodo_propuesta => @periodo_propuesta.attributes
    end

    assert_redirected_to periodo_propuesta_path(assigns(:periodo_propuesta))
  end

  test "should show periodo_propuesta" do
    get :show, :id => @periodo_propuesta.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @periodo_propuesta.to_param
    assert_response :success
  end

  test "should update periodo_propuesta" do
    put :update, :id => @periodo_propuesta.to_param, :periodo_propuesta => @periodo_propuesta.attributes
    assert_redirected_to periodo_propuesta_path(assigns(:periodo_propuesta))
  end

  test "should destroy periodo_propuesta" do
    assert_difference('PeriodoPropuesta.count', -1) do
      delete :destroy, :id => @periodo_propuesta.to_param
    end

    assert_redirected_to periodo_propuestas_path
  end
end
