class Food < ApplicationRecord
  #Asociations
  belongs_to :restaurant

  #validations
  validates :name, :description, :price, :available, presence: true

end
