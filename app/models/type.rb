class Type < ApplicationRecord
    has_many :goods

    validates :name, presence: true
    validates :description, presence: true 
end
