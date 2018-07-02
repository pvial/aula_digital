class Eje < ApplicationRecord
  # Direct associations

  has_many   :materias,
             :class_name => "Categorium",
             :dependent => :destroy

  has_many   :objetivos

  # Indirect associations

  # Validations

end
