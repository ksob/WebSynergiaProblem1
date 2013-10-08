require "spec_helper"

describe UsersController do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the posts into @users" do
      user1, user2 = User.create!(email: 'e@e.com', username: 'u1'), 
      				 User.create!(email: 'e@e2.com', username: 'u2')
      get :index

      expect(assigns(:users)).to match_array([user1, user2])
    end
  end

  describe "POST #assign_groups" do
  	context "user is assigned to a no group" do
	  	before do
		  @user = User.create(email: 'e@e.com', username: 'myusername', password: 'asdf')
	      user_group_ids = {:group_ids => [""]}
	      post :assign_groups, user: user_group_ids, user_id: @user.id
	  	end

	  	it "responds successfully with an HTTP 200 status code" do
		  expect(response).to be_success
	      expect(response.status).to eq(200)
	    end

	    it "renders the index template" do
	      expect(response).to render_template("index")
	    end

	    it "the user should be assigned to the group" do
	      expect(@user.groups).to eq([])
	    end
    end

  	context "user is assigned to a single group" do
	  	before do
	  	  @group = Group.create(name: 'Admin')
		  @user = User.create(email: 'e@e.com', username: 'myusername', password: 'asdf')
	      user_group_ids = {:group_ids => ["1", ""]}
	      post :assign_groups, user: user_group_ids, user_id: @user.id
	  	end

	  	it "responds successfully with an HTTP 200 status code" do
		  expect(response).to be_success
	      expect(response.status).to eq(200)
	    end

	    it "renders the index template" do
	      expect(response).to render_template("index")
	    end

	    it "the user should be assigned to the group" do
	      expect(@user.groups).to eq([@group])
	    end
    end

    context "user is assigned to two groups" do
	    it "the user should be assigned to the group" do
	      @group = Group.create(name: 'Admin')
	  	  @group2 = Group.create(name: 'User')
		  @user = User.create(email: 'e@e.com', username: 'myusername', password: 'asdf')
	      user_group_ids = {:group_ids => ["1", "2", ""]}
	      post :assign_groups, user: user_group_ids, user_id: @user.id
	  	
	      expect(@user.groups).to eq([@group,@group2])
	    end
    end
  end
end