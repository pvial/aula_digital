class Eje < ApplicationRecord
  # Direct associations

  belongs_to :materia,
             :class_name => "Materium"

  has_many   :objetivos

  # Indirect associations

  # Validations

end
