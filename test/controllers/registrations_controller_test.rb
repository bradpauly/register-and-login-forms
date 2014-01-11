require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  test "shows registration form" do
    get :new
    assert_response :success
  end

  test "redirects on processed form" do
    post(
      :create, registration_form: {
        name:'Bob Smith',
        email:'bob@example.com',
        password:'testing',
        password_confirmation:'testing'
      }
    )

    assert_redirected_to '/'
  end

  test "shows form on incomplete input" do
    post :create, registration_form: {name:'Bob Smith'}
    assert_response :success
    assert_template :new
  end
end
