module Common
  extend ActiveSupport::Concern

  private
  
  # 高いrankの重複している数をカウントするメソッド
  def equal_count(danger_list)
    # 引数のdanger_listを降順に並び替え
    danger_list.sort! {|x,y| y<=>x}
    # 重複している数のカウント用に設定。初期値は１。
    priority_count = 1
    # ２回のループを回して、一番高いrankの値がいくつあるかをカウント
    (danger_list.length - 1).times do |n|
      if danger_list[n] == danger_list[n + 1]
        priority_count += 1
      else
        break
      end
    end
    # 最終的に高いrank値の個数をpriority_countとして返す。
    priority_count
  end

  # priority_listとpriority_countを引数として、優先すべきrankを割り出す。 
  def rank_types(priority_list, priority_count)
    # 引数に代入したpriority_listを降順に並び替え
    priority_list.sort! { |x,y| y[1]<=>x[1] }
    # 高いrankの名称を入れるための空listを用意
    priority_disaster = []
    # 降順にしたpriority_listのpriority_count番目まで切り出してpriority_disaster（空list）に格納
    priority_list.first(priority_count).each do |n| 
      priority_disaster << n[0]
    end
    # 高いrankが格納されたpriprity_rankを返す。（array型）
    priority_disaster
  end
end
