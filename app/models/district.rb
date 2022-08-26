class District < ApplicationRecord
    has_many :towns

    validates :name, presence: true
end
