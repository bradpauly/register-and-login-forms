class User < ActiveRecord::Base
  validates :name, :email, presence: true

  def password=(new_password)
    self.password_salt = random_token
    self.password_digest = secure_digest(new_password, password_salt)
  end

  def change_password(new_password)
    self.password = new_password
    save
  end

  def password_matches?(password)
    password_digest == secure_digest(password, password_salt)
  end

private
  def random_token
    SecureRandom.hex
  end

  def secure_digest(*tokens)
    Digest::SHA512.hexdigest(tokens.flatten.compact.join)
  end
end
