class User < ApplicationRecord
  belongs_to :user_role

  def self.validate_login(email_address, password)
  	user = User.where("email_address = ? OR username = ?",email_address,email_address).first
  	if user && user.password == Digest::MD5.hexdigest(password)
  		user
  	else
  		nil
  	end
  end
end
