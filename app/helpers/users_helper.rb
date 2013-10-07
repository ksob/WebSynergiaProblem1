module UsersHelper
	def get_users_except_current
	  users = []
 	  User.all.each do |u|
 	  	if u.username == User.current_user.username
 	  		next
 	  	end
 	  	users << u
 	  end
 	  users
	end
end