class DiagnosisController < ApplicationController
  def search
    @districts = District.all
    @towns = Town.all
  end

  def result
    @rank = Rank.find_by(town_id: params[:town_id])
    @fire_danger_rank = @rank.fire_danger_rank.to_json.html_safe
    @building_collapse_rank = @rank.building_collapse_rank.to_json.html_safe
    @active_difficulty_rank = @rank.active_difficulty_rank.to_json.html_safe
  end
end
