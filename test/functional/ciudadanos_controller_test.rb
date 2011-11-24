require 'test_helper'

class CiudadanosControllerTest < ActionController::TestCase
  setup do
    @ciudadano = ciudadanos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ciudadanos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ciudadano" do
    assert_difference('Ciudadano.count') do
      post :create, :ciudadano => @ciudadano.attributes
    end

    assert_redirected_to ciudadano_path(assigns(:ciudadano))
  end

  test "should show ciudadano" do
    get :show, :id => @ciudadano.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ciudadano.to_param
    assert_response :success
  end

  test "should update ciudadano" do
    put :update, :id => @ciudadano.to_param, :ciudadano => @ciudadano.attributes
    assert_redirected_to ciudadano_path(assigns(:ciudadano))
  end

  test "should destroy ciudadano" do
    assert_difference('Ciudadano.count', -1) do
      delete :destroy, :id => @ciudadano.to_param
    end

    assert_redirected_to ciudadanos_path
  end
end
