class UserAuthenticator
  attr_accessor :user

  def initialize(user)
    @user = user
  end

  # TODO: Make this work with encrypted passwords.
  def authenticate(password)
    user && user.password == password
  end
end
