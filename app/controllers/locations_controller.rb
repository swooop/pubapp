class LocationsController < ApplicationController

  # This action lists all locations (it acts on the collection)
  def index
    @locations = Location.all
  end

  # This action shows the detail of an individual location (it acts on the member of the collection)
  # so we must provide an id
  def show
    @location = Location.find(params[:id])
  end

  # This action shows a form for adding new members, so it must act on the collection (we don't have a member yet)
  def new
    @location = Location.new
  end

  # This action creates a new location and then redirects to index probably (or show), so it acts on the collection
  # (adding a new member to it)
  def create
    @location = Location.new(params[:location])
  end

  # This action shows a form for editing a location, so we must provide the member id (it acts on a member)
  def edit
    @location = Location.find(params[:id])
  end

  # This action updates a location and then redirects to index probably (or show), so it acts on a member
  # and we must proived that member's id
  def update
    @location = Location.find(params[:id])
    @location.update_attributes(params[:location])
  end

  # This action deletes a location and then redirects to index, so it acts on a member and needs the id
  def destroy
    @location = Location.find(params[:id])
  end
end
