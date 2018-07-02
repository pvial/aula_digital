class Profesor < ApplicationRecord
  # Direct associations

  has_many   :salas,
             :dependent => :destroy

  has_many   :tests,
             :dependent => :destroy

  # Indirect associations

  has_many   :colegios,
             :through => :salas,
             :source => :colegio

  has_many   :students,
             :through => :salas,
             :source => :users

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
