class User < ActiveRecord::Base
	has_many :posts

	has_secure_password

	def full_name
		"#{self.first_name} #{self.last_name}"
	end
end
