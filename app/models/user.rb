class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

#asociaciones
has_many :restaurants #habilita el metodo .restaurants que puedo aplicarle un each

#active record
has_one_attached :photo
end
