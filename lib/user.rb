class User

	attr_accessor :email, :age
	@@list_users = []

	def initialize(mail, age)
		@email = mail
		@age = age
		@@list_users << self
	end

	def self.show_all
		puts @@list_users
	end

	def self.find_by_email(email_searched)

		@@list_users.each { |user| return user if email_searched == user.email }

	end

end