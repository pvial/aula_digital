class Answer < ApplicationRecord
  # Direct associations

  belongs_to :excercise,
             :class_name => "Ejercicio"

  # Indirect associations

  # Validations

end
