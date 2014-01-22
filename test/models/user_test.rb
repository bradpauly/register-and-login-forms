require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "checks the password" do
    bob = users(:bob)
    assert bob.password_matches?('testing')
  end

  test "changes the password" do
    bob = users(:bob)
    bob.change_password('foo')
    assert bob.password_matches?('foo')
  end

end
