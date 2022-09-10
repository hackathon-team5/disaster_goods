class TownsController < ApplicationController
  def index
    district = District.find(params[:district_id])
    render json: district.towns.select(:id, :name)
  end
end
