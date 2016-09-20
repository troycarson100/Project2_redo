class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

# replace with bcrypt validation
  has_secure_password
end
