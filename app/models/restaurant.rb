class Restaurant < ApplicationRecord
  #Asociations
  belongs_to :user
  has_many :schedules
  has_many :foods
  #validations
  validates :name, :address, presence: true
  #active record
  has_one_attached :photo
end
