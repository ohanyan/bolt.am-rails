class User < ActiveRecord::Base
	include BCrypt
	before_create :generate_authentication_token

	has_many :rates, foreign_key: 'rated_id'
	belongs_to :location


	has_secure_password


	def password
	  @password ||= Password.new(password_digest)
	end
	def password=(new_password)
	   @password = Password.create(new_password)
	   self.password_digest = @password
	end


	def generate_authentication_token
	  loop do
	    self.authentication_token = SecureRandom.base64(64)
	    break unless User.find_by(authentication_token: authentication_token)
	  end
	end

	def valid_token?(token)
		ActiveSupport::SecurityUtils.secure_compare(self[:authentication_token], token)
	end

	#Expose token and email only to session controller
	def authentication_token_for_session
		self[:authentication_token]
	end

	def email_for_session
		self[:email]
	end

	private
	def authentication_token
	end

	def email
	end

end