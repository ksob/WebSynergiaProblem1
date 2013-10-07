class UsersController < ApplicationController
  def log_in

  end

  def check_log_in
  	user = User.find_by(email: params[:user][:email])
  	if user and user[:password] == params[:user][:password]
 	  @current_user = user
  	  render 'select_groups_to_assign'
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'log_in'
    end
  end

end