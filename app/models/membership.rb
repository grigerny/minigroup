class Membership < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  
  attr_accessible :event_id, :user_id, :status
  validates_uniqueness_of :event_id, :message => "can be only joined once", :scope => 'user_id'
end
