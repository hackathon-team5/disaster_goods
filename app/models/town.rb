class Town < ApplicationRecord
    belongs_to :district
    has_many :ranks

    validates :name, presence: true
    validates :district_id, presence: true 
end
