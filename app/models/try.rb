class Try < ApplicationRecord
  # Direct associations

  belongs_to :intento_guia,
             :required => false,
             :class_name => "IntentoTest"

  belongs_to :user,
             :counter_cache => true

  belongs_to :excercise,
             :class_name => "Ejercicio"

  # Indirect associations

  # Validations

end
