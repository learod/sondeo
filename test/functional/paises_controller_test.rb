require 'test_helper'

class PaisesControllerTest < ActionController::TestCase
  setup do
    @pais = paises(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paises)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pais" do
    assert_difference('Pais.count') do
      post :create, :pais => @pais.attributes
    end

    assert_redirected_to pais_path(assigns(:pais))
  end

  test "should show pais" do
    get :show, :id => @pais.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @pais.to_param
    assert_response :success
  end

  test "should update pais" do
    put :update, :id => @pais.to_param, :pais => @pais.attributes
    assert_redirected_to pais_path(assigns(:pais))
  end

  test "should destroy pais" do
    assert_difference('Pais.count', -1) do
      delete :destroy, :id => @pais.to_param
    end

    assert_redirected_to paises_path
  end
end
