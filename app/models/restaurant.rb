class Restaurant < ApplicationRecord
  include PgSearch::Model
  #Asociations
  belongs_to :user
  has_many :schedules
  has_many :foods
  #validations
  validates :name, :address, presence: true
  validates :description, length: {minimum: 1, maximum: 500}
  #active record
  has_one_attached :photo

  #pg search
  pg_search_scope :search_all_restaurants,
    against: [ :name, :description, :address, :specialty ],
    using: {
      tsearch: { prefix: true }
    }
end
