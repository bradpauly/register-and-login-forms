class LoginForm
  SECRET = 'testing'
  ATTRIBUTES = [:email, :password]

  attr_accessor *ATTRIBUTES

  def initialize(attributes = {})
    ATTRIBUTES.each do |attribute|
      send("#{attribute}=", attributes[attribute])
    end unless attributes.nil?
  end

  def process
    !email.blank? && password == SECRET
  end
end
