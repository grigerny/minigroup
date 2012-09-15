require 'test_helper'

class MembershipTest < ActiveSupport::TestCase
  fixtures :users
  def setup
  @user = users(:valid_user)
  @event = users(:event
  end
  
  def test_request
  Membership.request(@user, @event)
  assert Membership.exists?(@user, @event)
  assert_status @user, @event, 'pending'
  assert_status @event, @user, 'requested'
  end
  
  def test_accept
  Membership.request(@user, @event)
  Membership.accept(@user, @event)
  assert Membership.exists?(@user, @event)
  assert_status @user, @event, 'accepted'
  assert_status @event, @user, 'accepted'
  end
  
  def test_breakup
  Membership.request(@user, @event)
  Membership.breakup(@user, @event)
  assert !Membership.exists?(@user, @event)
  end
  
  private
  # Verify the existence of a membership with the given status.
  def assert_status(user, event, status)
  membership = Membership.find_by_user_id_and_event_id(user, event)
  assert_equal status, membership.status
  end
end