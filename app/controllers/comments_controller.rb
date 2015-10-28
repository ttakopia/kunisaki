class CommentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "作成できました！"
      redirect_to event_path(@event)
    else
      render :template => "events/show"
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @comment = @event.comments.find(params[:id])
    @comment.destroy
    redirect_to :events
  end

  private
  def comment_params
    params.require(:comment).permit(
      :commenter,
      :body
      )
  end
end