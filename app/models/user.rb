class User < ActiveRecord::Base
  has_many :assignments
  has_many :groups, :through => :assignments

  cattr_accessor :current_user
end