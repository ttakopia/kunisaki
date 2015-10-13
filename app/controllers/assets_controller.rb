class AssetsController < ApplicationController
  
  def destroy
    @picture = Picture.find(params[:picture_id])
    @asset = @picture.assets.find(params[:id])
    @asset.destroy
    redirect_to :pictures
  end
end