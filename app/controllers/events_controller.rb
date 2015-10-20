class EventsController < ApplicationController
  before_action :authenticate_user!, except:[:show]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def adjust_image(b)
      require 'RMagick'
      i = Magick::Image.from_blob(b.read)[0]
      if i.columns > 1024
        return i.resize(0.5).to_blob
      else
        return i.to_blob
      end
    end

  def show_picture
    n = "picture_"+ (params["name"] || "main")
    d = @event.send(n)
    if d
      send_data d, :type => 'image/jpeg', :disposition => "inline"
    else
      raise ActionController::RoutingError.new('Picture of '+@event.title+' '+n+' not found')
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      p = params.require(:event).permit(:user_id, :title, :opendate, :opendate_memo, :postal, :address, :address_embed, :fee, :limit,:desc_short, :desc_long, :picture_main, :picture_1,
            :picture_2, :picture_3, :url, :url_facebook, :url_twitter,:visible)
      　[:picture_main,:picture_1,:picture_2,:picture_3].each do |k|
        p[k] = adjust_image(p[k]) if p[k]
      end
      return p
    end
end
