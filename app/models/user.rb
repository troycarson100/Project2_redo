class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  def password=(unencrypted_password)
    @password = unencrypted_password
    self.password_digest = BCrypt::Password.create(@password)
  end

  def password(pass)
    if BCrypt::Password.new(self.password_digest) == pass
      return self
    else
      return false
    end
  end
end
