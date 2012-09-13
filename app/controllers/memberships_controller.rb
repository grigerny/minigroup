class MembershipsController < ApplicationController
  
def new
  @membership = Membership.new
end  
def create
   @membership = current_user.memberships.build(:event_id => params[:event_id])
   if @membership.save
     flash[:notice] = "You have joined this event."
     redirect_to :back
   else
     flash[:error] = "Unable to join."
     redirect_to :back
   end
 end

def destroy
   @membership = current_user.memberships.find(params[:id])
     @membership.destroy
     flash[:notice] = "Removed membership."
         redirect_to :back
end

def index
  @memberships = Membership.all
end

end