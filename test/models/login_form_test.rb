require 'test_helper'

class LoginFormTest < ActiveSupport::TestCase
  test "has email and password" do
    form = LoginForm.new(email:'bob@example.com', password:'secret')
    assert form.email
    assert form.password
  end

  test "missing fields are blank" do
    form = LoginForm.new(email:'bob@example.com')
    assert form.email
    assert form.password.blank?
    refute form.password
  end
end
