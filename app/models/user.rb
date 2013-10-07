class User < ActiveRecord::Base
  has_many :assignments
  has_many :roles, :through => :assignments

  #attr_accessible :email, :username, :password, :remember_me, :password_confirmation, 
  #	:reset_password_sent_at, :remember_created_at, :sign_in_count, 
  #	:current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, 
  #	:last_sign_in_ip#, :roles, :roles_mask
  
  def has_role?(role_sym)
	   roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end

end