class User < ActiveRecord::Base

  # original code from http://railscasts.com/episodes/241-simple-omniauth-revised
	def self.from_omniauth(auth)
		where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
	end

	def self.create_from_omniauth(auth) 
		create! do |user| 
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			user.name = auth["info"]["nickname"]
		end
	end
end
