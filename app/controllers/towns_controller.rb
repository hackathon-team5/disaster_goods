class TownsController < ApplicationController
  def index
    district = District.includes(:towns).find(params[:district_id])
    render json: district.towns.select(:id, :name)
  end
end
