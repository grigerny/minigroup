class CommentsController < ApplicationController
  def create
      @event = Event.find(params[:event_id])
      @comment = @event.comments.build(params[:comment])
      @comment.user_id = current_user.id
      @comment.save!
      redirect_to @event
  end
end
