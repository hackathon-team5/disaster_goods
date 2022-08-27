class Rank < ApplicationRecord
    belongs_to :town

    validates :total_danger_rank, presence: true
    validates :fire_danger_rank, presence: true
    validates :building_collapse_rank, presence: true
    validates :active_difficulty_rank, presence: true
end
