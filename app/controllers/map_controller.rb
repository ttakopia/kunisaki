class MapController < ApplicationController
  def index
    @pictures = Picture.all
    @hash = Gmaps4rails.build_markers(@pictures) do |picture, marker|
      marker.lat picture.latitude
      marker.lng picture.longitude
      marker.infowindow picture.description
      marker.json({title: picture.title})
    end
  end
end