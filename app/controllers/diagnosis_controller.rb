class DiagnosisController < ApplicationController
  include Common

  def search
    @districts = District.all
    @towns = Town.all
  end

  def result
    @rank = Rank.find_by(town_id: params[:town_id])
    @fire_danger_rank = @rank.fire_danger_rank.to_json.html_safe
    @building_collapse_rank = @rank.building_collapse_rank.to_json.html_safe
    @active_difficulty_rank = @rank.active_difficulty_rank.to_json.html_safe
    danger_list = [@fire_danger_rank, @building_collapse_rank, @active_difficulty_rank]
    priority_list = [['fire', @fire_danger_rank], ['building', @building_collapse_rank], ['active', @active_difficulty_rank]]
    # 下２行のメソッドは、app/controller/concerns/common.rbで定義している。
    priority_count = equal_count(danger_list)
    priority_ranks = rank_types(priority_list, priority_count)
    @type_id = if (priority_count == 1) && (priority_ranks == ['fire'])
                  1
                elsif (priority_count == 1) && (priority_ranks == ['building'])
                  2
                elsif (priority_count == 1) && (priority_ranks == ['active'])
                  3
                elsif (priority_count == 2) && (priority_ranks.sort == ['building', 'fire'].sort)
                  4
                elsif (priority_count == 2) && (priority_ranks.sort == ['active', 'fire'].sort)
                  5
                elsif (priority_count == 2) && (priority_ranks.sort == ['active', 'building'].sort)
                  6
                elsif priority_count == 3
                  7
                end
    # type_idに紐づくTypeインスタンスを取得
    @type = Type.find(@type_id)
  end
end
