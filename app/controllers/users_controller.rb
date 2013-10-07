class UsersController < ApplicationController
  def log_in
  end

  def check_log_in
  	user = User.find_by(email: params[:user][:email])
  	if user and user[:password] == params[:user][:password]
 	  User.current_user = user
  	  render 'select_groups_to_assign'
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'log_in'
    end
  end

  def assign_groups
  	user = User.find_by_id params[:user_id]
  	role_ids = params[:user][:role_ids]
  	if role_ids.length > 1
  		role_ids.each do |role_id|
  			break if role_id == ""
  			role = Role.find_by_id role_id
  			role.assignments.create(user: user, role: role)
  		end
  	end

  	@users = User.all
  	render 'index'
  end

  def index
  	@users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @users }
      format.json{ render :json => @users }
    end
  end
end