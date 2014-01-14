class LoginForm
  ATTRIBUTES = [:email, :password]

  attr_accessor *ATTRIBUTES

  def initialize(attributes = {})
    ATTRIBUTES.each do |attribute|
      send("#{attribute}=", attributes[attribute])
    end unless attributes.nil?
  end
end
