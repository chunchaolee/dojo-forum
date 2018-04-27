# admin 帳號
User.create!(email: "admin@example.com", name: "Admin", password: "12345678", is_admin: true)
puts "Default admin created!"