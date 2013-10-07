class UsersController < ApplicationController
  def assign_group
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @users }
      format.json{ render :json => @users }
    end
  end
end