require 'test_helper'

class BusinessesControllerTest < ActionController::TestCase
  setup do
    @business = businesses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:businesses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create business" do
    assert_difference('Business.count') do
      post :create, business: { address1: @business.address1, address2: @business.address2, city: @business.city, description: @business.description, location: @business.location, name: @business.name, phone1: @business.phone1, phone2: @business.phone2, state: @business.state, website: @business.website, zip: @business.zip }
    end

    assert_redirected_to business_path(assigns(:business))
  end

  test "should show business" do
    get :show, id: @business
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @business
    assert_response :success
  end

  test "should update business" do
    patch :update, id: @business, business: { address1: @business.address1, address2: @business.address2, city: @business.city, description: @business.description, location: @business.location, name: @business.name, phone1: @business.phone1, phone2: @business.phone2, state: @business.state, website: @business.website, zip: @business.zip }
    assert_redirected_to business_path(assigns(:business))
  end

  test "should destroy business" do
    assert_difference('Business.count', -1) do
      delete :destroy, id: @business
    end

    assert_redirected_to businesses_path
  end
end
