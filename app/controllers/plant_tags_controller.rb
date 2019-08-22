class PlantTagsController < ApplicationController
  before_action :set_plant, only: %i[new create]
  def new
    @plant_tag = PlantTag.new
  end

  def create
    tags = Tag.find(params[:plant_tag][:tag])
    tags.each do |tag|
      PlantTag.create(plant: @plant, tag: tag)
    end
    redirect_to @plant.garden
  end

  private

  def set_plant
    @plant = Plant.find(params[:plant_id])
  end
end
