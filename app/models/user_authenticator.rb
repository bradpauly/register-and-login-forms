class UserAuthenticator
  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def authenticate(password)
    user && user.password_matches?(password)
  end
end
