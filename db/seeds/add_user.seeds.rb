User.create!([
	{ email_address: 'collector@gmail.com', username: 'collector', password: Digest::MD5.hexdigest('collector'), user_role_id: 2 }
])