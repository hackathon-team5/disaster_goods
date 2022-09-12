class Good < ApplicationRecord
    belongs_to :type

    validates :name, presence: true
    validates :description, presence: true 
    validates :type_id, presence: true 
end
