class Town < ApplicationRecord
    validates :name, presence: true
    validates :district_id, presence: true 
end
