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

  test "successfully processed with email and secret password" do
    assert LoginForm.new(email:'bob@example.com', password:'testing').process
    refute LoginForm.new(email:'bob@example.com', password:'nope').process
    refute LoginForm.new(password:'testing').process
  end
end
