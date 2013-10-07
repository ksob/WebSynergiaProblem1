require 'spec_helper'

describe "SelectGroups" do
  before do
  	group = Group.create(name: 'Admin')
	user = User.create(email: 'e@e.com', username: 'myusername', password: 'asdf')
	group.assignments.create(user: user, group: group)
	group = Group.create(name: 'User')
	user.assignments.create(user: user, group: group)
	group = Group.create(name: 'Other')
	user = User.create(email: 'a@a.com', username: 'myusername2', password: 'asdf')
    User.current_user = User.first
  end

  describe "GET /select_groups_to_assign" do
    it "returns a correct response status" do
      get select_groups_to_assign_path
      response.status.should be(200)
    end

	it "displays usernames to select" do
      visit select_groups_to_assign_path
      page.has_css?('select #user_id')
    end

    it "displays 'Admin' checkbox" do
      visit select_groups_to_assign_path
      expect(page).to have_content('Admin')
    end

    it "NOT displays 'Other' checkbox" do
      visit select_groups_to_assign_path
      expect(page).not_to have_content('Other')
    end
  end
end
