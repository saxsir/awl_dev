class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :authentication_keys => [:login]
  devise :recoverable, :rememberable, :trackable, :validatable

  validates :username,:presence=>true,:length=>{:maximum => 20}

  # Setup accessible (or protected) attributes for your model
  attr_accessor :login
  attr_accessible :email, :password,:icon, :password_confirmation, :remember_me, :artist, :username, :login

  # attr_accessible :title, :body
  has_many :projects
  has_many :supports
  has_attached_file :icon

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
end
