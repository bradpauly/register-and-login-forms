class RegistrationForm
  include ActiveModel::Validations

  ATTRIBUTES = [:name, :email, :password, :password_confirmation]

  attr_accessor *ATTRIBUTES

  validates :name, :email, :password, :password_confirmation, presence: true
  validates :password, confirmation: true

  def initialize(attributes = {})
    ATTRIBUTES.each do |attribute|
      send("#{attribute}=", attributes[attribute])
    end unless attributes.nil?
  end

  def process
    valid?
  end
end
