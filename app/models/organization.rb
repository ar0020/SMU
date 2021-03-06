class Organization < ActiveRecord::Base
  has_one :user
  has_many :groups
  has_one :address, through: :user
  has_many :users
  after_create :add_default_manager!
  after_create :add_default_group!


  def add_default_manager!
    new_admin = User.create do |user|
      user.email = "change_me#{User.count + 1}@smu.com"
      user.firstname = "Default"
      user.lastname = "User"
      user.role = "admin"
      user.password = "changeme"
      user.organization_id = self.id
    end
    self.user_id = new_admin.id
  end

  def add_default_group!
    Group.create do |group|
      group.name = "default group"
      group.organization_id = self.id
      group.user_id = self.user.id
    end
  end

end
