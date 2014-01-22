require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "shows login form" do
    get :new
    assert_response :success
  end

  test "redirects for valid credentials" do
    bob = users(:bob)
    bob.change_password('testing')
    post :create, login_form: { email:bob.email, password:'testing' }
    assert_redirected_to '/'
  end

  test "shows form on incomplete input" do
    post :create, login_form: { email:'bob@example.com' }
    assert_response :success
    assert_template :new
  end
end
