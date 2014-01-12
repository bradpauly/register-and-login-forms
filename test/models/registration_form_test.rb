require 'test_helper'

class RegistrationFormTest < ActiveSupport::TestCase
  def valid_input
    {
      name:'Bob Smith',
      email:'bob@example.com',
      password:'testing',
      password_confirmation:'testing',
      terms: "1"
    }
  end

  def valid_input_without(*exclude)
    valid_input.keep_if { |k, v| !exclude.include?(k) }
  end

  test "valid with all inputs" do
    refute RegistrationForm.new(valid_input_without(:password_confirmation)).valid?
    refute RegistrationForm.new(valid_input_without(:name, :email)).valid?
    refute RegistrationForm.new(name:'Bob Smith', email:'bob@example.com').valid?
    assert RegistrationForm.new(valid_input).valid?
  end

  test "processes valid input" do
    assert RegistrationForm.new(valid_input).process(User)
    refute RegistrationForm.new(name:'Bob Smith').process(User)
  end
end
