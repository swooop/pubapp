class PubsController < ApplicationController
  def index
    @pubs = Pub.all
  end

  def show
    @pub = Pub.find(params[:id])

    @lat = @pub.location.latitude
    @long = @pub.location.longitude

    
  end

  def search
    @locations = Location.near(params[:address]).includes(:pubs).limit(5)
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @locations, :include => [:pubs] }
    end
  end
end
