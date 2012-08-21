require 'securerandom'

class PasswordGenerator

	def generate(size=12,type='base64')
		size = size.to_i
		if self.allowed_types.include?(type)
    	SecureRandom.method(type).call(size)[0,size]
    else
    	"Unknown password type"
    end
	end

	def allowed_types
		["hex","base64","random_bytes"]
	end

	def echo_password(size=12,type='base64')
		puts self.generate(size,type)+"\n"
	end

end