class CommentsController < ApplicationController
  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "作成できました！"
      redirect_to picture_path(@picture)
    else
      render :template => "pictures/show"
    end
  end

  def destroy
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.find(params[:id])
    @comment.destroy
    redirect_to :pictures
  end

  private
  def comment_params
    params.require(:comment).permit(
      :commenter,
      :body
      )
  end
end