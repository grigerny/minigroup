class Event < ActiveRecord::Base
  has_many :memberships, :dependent => :destroy
  has_many :users, :through => :memberships
  belongs_to :user, foreign_key: 'user_id'
  has_many :comments

  attr_accessible :name, :user_id, :people, :views, :verb, :when, :tag_list, :location
  is_impressionable
  acts_as_taggable
  geocoded_by :location
  after_validation :geocode
  
  validates_presence_of :name

  
   def admin
         @user = session[:current_user]
    end
end
