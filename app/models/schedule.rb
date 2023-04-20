class Schedule < ApplicationRecord
  #Asociations
  belongs_to :restaurant
  #validations
  validates  :open_at, :close_at, presence: true
  # validamos con scope que esta relacion de dia y restaurant es unica
  validates :day, uniqueness: { scope: :restaurant_id,
   message: "Ya existe el dia para este restaurant" }

   #metodo enum nos va a dejar realizar una equivalencia entre integer y string
   enum :day, {
    lunes: 1,
    martes: 2,
    miercoles: 3,
    jueves: 4,
    viernes: 5,
    sabado: 6,
    domingo: 7
   }
end
