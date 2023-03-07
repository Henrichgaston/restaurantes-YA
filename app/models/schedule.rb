class Schedule < ApplicationRecord
  #Asociations
  belongs_to :restaurant
  #validations

  validates :day, :open_at, :close_at, presence: true

end
