require 'test_helper'

class AnteproyectosControllerTest < ActionController::TestCase
  setup do
    @anteproyecto = anteproyectos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:anteproyectos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create anteproyecto" do
    assert_difference('Anteproyecto.count') do
      post :create, :anteproyecto => @anteproyecto.attributes
    end

    assert_redirected_to anteproyecto_path(assigns(:anteproyecto))
  end

  test "should show anteproyecto" do
    get :show, :id => @anteproyecto.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @anteproyecto.to_param
    assert_response :success
  end

  test "should update anteproyecto" do
    put :update, :id => @anteproyecto.to_param, :anteproyecto => @anteproyecto.attributes
    assert_redirected_to anteproyecto_path(assigns(:anteproyecto))
  end

  test "should destroy anteproyecto" do
    assert_difference('Anteproyecto.count', -1) do
      delete :destroy, :id => @anteproyecto.to_param
    end

    assert_redirected_to anteproyectos_path
  end
end
