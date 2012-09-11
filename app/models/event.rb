class Event < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :user_id, :people, :views, :verb, :when, :tag_list
  is_impressionable
  acts_as_taggable
  
  validates_presence_of :name

  
   def admin
         @user = session[:current_user]
    end
end
