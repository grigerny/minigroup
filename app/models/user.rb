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
  has_attached_file :avatar, :styles => { :medium => "300x300#", :thumb => "100x100#" }
  
  attr_accessor :ip_address
  geocoded_by :ip_address
  after_validation :geocode
  
  validates_presence_of :username
  
end
