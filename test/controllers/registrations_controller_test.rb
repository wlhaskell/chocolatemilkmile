require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  setup do
    @registration = registrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registration" do
    assert_difference('Registration.count') do
      post :create, registration: { city: @registration.city, donation: @registration.donation, l_shirts: @registration.l_shirts, m_shirts: @registration.m_shirts, phone: @registration.phone, s_shirts: @registration.s_shirts, state: @registration.state, street: @registration.street, xl_shirts: @registration.xl_shirts, xs_shirts: @registration.xs_shirts, zip: @registration.zip }
    end

    assert_redirected_to registration_path(assigns(:registration))
  end

  test "should show registration" do
    get :show, id: @registration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registration
    assert_response :success
  end

  test "should update registration" do
    patch :update, id: @registration, registration: { city: @registration.city, donation: @registration.donation, l_shirts: @registration.l_shirts, m_shirts: @registration.m_shirts, phone: @registration.phone, s_shirts: @registration.s_shirts, state: @registration.state, street: @registration.street, xl_shirts: @registration.xl_shirts, xs_shirts: @registration.xs_shirts, zip: @registration.zip }
    assert_redirected_to registration_path(assigns(:registration))
  end

  test "should destroy registration" do
    assert_difference('Registration.count', -1) do
      delete :destroy, id: @registration
    end

    assert_redirected_to registrations_path
  end
end
