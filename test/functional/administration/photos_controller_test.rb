require 'test_helper'

class Administration::PhotosControllerTest < ActionController::TestCase
  setup do
    @administration_photo = administration_photos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administration_photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administration_photo" do
    assert_difference('Administration::Photo.count') do
      post :create, administration_photo: {  }
    end

    assert_redirected_to administration_photo_path(assigns(:administration_photo))
  end

  test "should show administration_photo" do
    get :show, id: @administration_photo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @administration_photo
    assert_response :success
  end

  test "should update administration_photo" do
    put :update, id: @administration_photo, administration_photo: {  }
    assert_redirected_to administration_photo_path(assigns(:administration_photo))
  end

  test "should destroy administration_photo" do
    assert_difference('Administration::Photo.count', -1) do
      delete :destroy, id: @administration_photo
    end

    assert_redirected_to administration_photos_path
  end
end
