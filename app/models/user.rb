class User < ApplicationRecord
    has_secure_password
    has_many :ratings 
    has_many :side_effects, through: :ratings 
    has_many :side_effects 
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates_presence_of :name, :email
    validates :name, length: {maximum: 255}
    validates :email, length: {maximum: 255}, uniqueness: {case_sensitive: false}, format: { with: EMAIL_REGEX}
    validates :password, length: { minimum: 6 }, allow_nil: true
    validates :smoking_status, inclusion: { in: ['regular', 'occasional', 'former', 'never', 'none of your business' ] }
end
