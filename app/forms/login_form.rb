class LoginForm
  ATTRIBUTES = [:email, :password]

  attr_accessor *ATTRIBUTES

  def initialize(attributes = {})
    ATTRIBUTES.each do |attribute|
      send("#{attribute}=", attributes[attribute])
    end unless attributes.nil?
  end

  def process
    # !password.blank?
    false
  end
  # 
  # def valid?
  #   false
  # end

  # def errors
  #   []
  # end
end
