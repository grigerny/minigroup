class Event < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :user_id, :people, :views, :verb, :tag_list, :tags
  acts_as_taggable_on :tags
  is_impressionable
end
