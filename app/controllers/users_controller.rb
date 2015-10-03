class UsersController < ApplicationController
  def create
    @picture = Picture.find(params[:picture_id])
    @user = @picture.users.build(user_params)
    redirect_to picture_path(@picture)
  end

  def destroy
    @picture = Picture.find(params[:picture_id])
    @user = @picture.comments.find(params[:id])
    @user.destroy
    redirect_to picture_path(@picture)
  end

  private
    def user_params
      params.require(:user).permit(:commenter,:body)
    end
end