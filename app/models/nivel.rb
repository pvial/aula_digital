class Nivel < ApplicationRecord
  # Direct associations

  has_many   :classrooms

  has_many   :objetivos

  # Indirect associations

  # Validations

end
