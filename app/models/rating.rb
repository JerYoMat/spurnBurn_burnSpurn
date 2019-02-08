class Rating < ApplicationRecord
    belongs_to :user 
    belongs_to :health_warning
validates :score, presence: true 
end
