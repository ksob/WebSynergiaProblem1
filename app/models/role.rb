class Role < ActiveRecord::Base
  has_many :assignments
  has_many :users, :through => :assignments

  #attr_accessible :name, :assignment_ids, :user_ids
end