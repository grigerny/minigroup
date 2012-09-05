class Event < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :user_id, :people, :views, :verb
  
  def pageviews
      self.increment!(:views)
  end
end
