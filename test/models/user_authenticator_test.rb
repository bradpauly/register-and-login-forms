require 'test_helper'

class UserAuthenticatorTest < ActiveSupport::TestCase
  test "handles unknown user" do
    refute UserAuthenticator.new(nil).authenticate('foo')
  end

  test "succeeds with correct password" do
    user = User.new(password:'testing')
    assert UserAuthenticator.new(user).authenticate('testing')
    refute UserAuthenticator.new(user).authenticate('foo')
  end
end
