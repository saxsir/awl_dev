class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :authentication_keys => [:username]
  devise :recoverable, :rememberable, :trackable, :validatable
  
  validates :username,:presence=>true,:length=>{:maximum => 20}
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :artist, :username
  # attr_accessible :title, :body
  has_many :projects
end
