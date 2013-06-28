require 'role_model'

class User < ActiveRecord::Base
  include RoleModel
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :username, :password_confirmation, :remember_me, :roles_mask

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :title, :body
  validates_presence_of :email, :username
  has_many :memberships
  has_many :teams, through: :memberships

  roles_attribute :roles_mask
  roles :admin, :user

  before_save :default_roles

  def default_roles
    if self.roles_mask == nil
      self.roles = :user
    end
  end
  
end
