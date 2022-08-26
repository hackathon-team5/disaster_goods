class Town < ApplicationRecord
    belongs_to :district

    validates :name, presence: true
    validates :district_id, presence: true 
end
