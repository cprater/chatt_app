class User < ActiveRecord::Base
	has_secure_password
	validates :name, uniqueness: true, presence: true

  has_many :messages
  has_many :chatrooms
end
