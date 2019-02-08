class HealthWarning < ApplicationRecord
has_many :ratings 
belongs_to :user 
belongs_to :product 
validates :name, presence: true, length: {maximum: 255}, uniqueness: {case_sensitive: false}  
validates :link, presence: true, length: {maximum: 255}, uniqueness: {case_sensitive: false}
validates_format_of :link, :with => %r{\.(png|jpg|jpeg)\z}i


end
