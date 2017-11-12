User.create!([
	# { email_address: 'collector@gmail.com', username: 'collector', password: Digest::MD5.hexdigest('collector'), user_role_id: 2 },
	{ email_address: 'admin@gmail.com', username: 'admin', password: Digest::MD5.hexdigest('admin'), user_role_id: 1 }
])