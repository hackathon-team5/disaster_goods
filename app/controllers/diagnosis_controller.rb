class DiagnosisController < ApplicationController
  def search
    @districts = District.all
    @towns = Town.all
  end

  def result
    @rank = Rank.find_by(town_id: params[:town_id])
  end
end
