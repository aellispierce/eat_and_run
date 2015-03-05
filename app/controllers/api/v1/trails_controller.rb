class Api::V1::TrailsController < ApplicationController

  def index
    all_trails = Trail.new("Durham")
    render json: all_trails
  end


end
