class UsersController < ApplicationController
  def log_in
  end

  def check_log_in
  	user = User.find_by(email: params[:user][:email])
  	if user and user[:password] == params[:user][:password]
 	  User.current_user = user
 	  @users = []
 	  User.all.each do |u|
 	  	if u.username == User.current_user.username
 	  		next
 	  	end
 	  	@users << u
 	  end
  	  render 'select_groups_to_assign'
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'log_in'
    end
  end

  def assign_groups
  	user = User.find_by_id params[:user_id]
  	group_ids = params[:user][:group_ids]
  	if group_ids.length > 1
  		group_ids.each do |group_id|
  			break if group_id == ""
  			group = Group.find_by_id group_id
  			group.assignments.create(user: user, group: group)
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