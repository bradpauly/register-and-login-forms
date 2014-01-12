class RegistrationForm
  include ActiveModel::Validations

  ATTRIBUTES = [:name, :email, :password, :password_confirmation, :terms]

  attr_accessor *ATTRIBUTES

  validates :name, :email, :password, :password_confirmation, :terms, presence: true
  validates :password, confirmation: true
  validates :terms, acceptance: true

  def initialize(attributes = {})
    ATTRIBUTES.each do |attribute|
      send("#{attribute}=", attributes[attribute])
    end unless attributes.nil?
  end

  def process(klass)
    return false unless valid?
    resource = klass.new(name: name, email: email, password: password)
    resource.save
  end
end
