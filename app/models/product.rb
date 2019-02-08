class Product < ApplicationRecord
has_many :health_warnings
has_many :users, through: :health_warnings
validates :name, presence: true, length: {maximum: 255}, uniqueness: {case_sensitive: false}  
validates :logo_path, presence: true, length: {maximum: 255}, uniqueness: {case_sensitive: false}
validates_format_of :logo_path, :with => %r{\.(png|jpg|jpeg|gif)\z}i
end
