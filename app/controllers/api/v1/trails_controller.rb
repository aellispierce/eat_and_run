module Api

  module V1

    class TrailsController < ApplicationController

      def index
        calorie_count = Food.new(params[:food])
        all_trails = TrailList.new(params[:city])
        render json: {food:calorie_count, trail:all_trails}
      end
    end
  end
end
