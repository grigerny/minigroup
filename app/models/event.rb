class Event < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :user_id, :people, :views, :verb, :tag_list, :tags, :when
  acts_as_taggable_on :tags
  is_impressionable
  
  validates_presence_of :name
  validates_presence_of :tag_list
  
   def admin
         @user = session[:current_user]
    end
end
