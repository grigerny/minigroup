class EventsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  impressionist :actions=>[:show]
  impressionist :unique => [:session_hash]
  respond_to :html, :json
  authorize_resource
  
  # GET /events
  # GET /events.json
  def index
    @event = Event.new
    @search = Event.search(params[:q])
    @events = @search.result.paginate(:page => params[:page], :per_page => 5 )
 
  
    if params[:search].present?
       @events = Event.near(params[:search], 15, :order => :distance).paginate(:page => params[:page], :per_page => 5 )
     end
     
    respond_to do |format|
      format.html # index.html.erb
      ajax_respond format, :section_id => "page"
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
      @user = current_user
      @user.ip_address = request.ip
      @user.save
      
      @search = Event.search(params[:q])
      @events = @search.result.paginate(:page => params[:page], :per_page => 5 )


      if params[:search].present?
         @events = Event.near(params[:search], 15, :order => :distance).paginate(:page => params[:page], :per_page => 5 )
       end
      
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit

    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])
    @event.user_id = current_user.id
    
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
    respond_with @event
  end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
  
  def tagged
        if params[:tag].present? 
        @events = Event.tagged_with(params[:tag])
      else 
        @events = Event.postall
      end  
  end  
  
  def join
      @event = Event.find(params[:id])
      @membership = @event.memberships.build(:user_id => current_user.id)
      
      respond_to do |format|
        if @membership.save
          format.html { redirect_to(@event, :notice => 'You have joined this event.') }
          format.xml  { head :ok }
        else
          format.html { redirect_to(@event, :notice => 'You have already joined this event') }
          format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
        end
      end
    end
    
  def unjoin  
    @event = Event.find(params[:id])
    @membership = @event.memberships.find_by_user_id(current_user.id)
    @membership.destroy rescue nil
    redirect_to(@event, :notice => 'You have left this event.')
  end
  
end
