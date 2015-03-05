class Api::V1::TrailsController < ApplicationController

  def index
    all_trails = Trail.new(params[:city])
    render json: all_trails
  end


end
