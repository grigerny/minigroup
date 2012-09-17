class User < ActiveRecord::Base
  has_many :memberships, :dependent => :destroy
  has_many :events, :through => :memberships, :dependent => :destroy
  has_many :events, :as => :owner, :class_name => "Event", :dependent => :destroy

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :avatar
  # attr_accessible :title, :body
  has_attached_file :avatar, :styles => { :medium => "300x300#", :thumb => "100x100#" }
  geocoded_by :current_sign_in_ip
  after_validation :geocode
  
  validates_presence_of :username
end
