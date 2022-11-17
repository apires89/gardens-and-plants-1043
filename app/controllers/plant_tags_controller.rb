class PlantTagsController < ApplicationController
  before_action :set_plant, only: [:new,:create]
  def new
    @plant_tag = PlantTag.new
  end

  def create
    @tags = Tag.where(params[:plant_tag][:tag_id])
    @tags.each do |tag|
      @plant_tag = PlantTag.create(plant: @plant, tag: tag)
    end
    redirect_to garden_path(@plant.garden)
    # if @plant_tag.save
    #   redirect_to garden_path(@plant.garden)
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

  private

  def set_plant
    @plant = Plant.find(params[:plant_id])
  end

end
