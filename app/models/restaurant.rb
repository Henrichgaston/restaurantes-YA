class Restaurant < ApplicationRecord
  #Asociations
  belongs_to :user
  has_many :schedules
  has_many :foods
  #validations
  validates :name, :address, presence: true
  validates :description, length: {minimum: 1, maximum: 500}
  #active record
  has_one_attached :photo
end
