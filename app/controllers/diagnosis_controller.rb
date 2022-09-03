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
    
    danger_list = [ @fire_danger_rank, @building_collapse_rank, @active_difficulty_rank]
    priority_list = [['fire', @fire_danger_rank], ['building', @building_collapse_rank], ['active', @active_difficulty_rank]]
    priority_count = equal_count(danger_list)
    priority_ranks = priority_rank(priority_list, priority_count)
    @types_id =
    if priority_count ==1 && priority_ranks == ['fire']
      1
    elsif priority_count == 1 && priority_ranks == ['building']
      2
    elsif priority_count == 1 && priority_ranks == ['active']
      3
    elsif priority_count == 2 && priority_ranks.sort == ['fire', 'building'].sort
      4
    elsif priority_count == 2 && priority_ranks.sort == ['fire','active'].sort
      5
    elsif priority_count == 2 && priority_ranks.sort == ['building', 'active'].sort
      6
    elsif priority_count == 3
      7
    end
  end

  private

  def equal_count(list)
    list.sort! {|x,y| y<=>x}
    count = 1
    pointed_at = 0
    (list.length - 1).times do
      if list[pointed_at] == list[pointed_at + 1]
        count += 1
      else
        break
      end
      pointed_at += 1
    end
    count
  end

  def priority_rank(list, count)
    list.sort! { |x,y| y[1]<=>x[1] }
    priority_disaster = []
    list.first(count).each do |n| 
      priority_disaster << n[0]
    end
    priority_disaster
  end
end
