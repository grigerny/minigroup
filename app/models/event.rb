class Event < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :user_id, :people
end
