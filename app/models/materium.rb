class Materium < ApplicationRecord
  # Direct associations

  has_many   :ejes,
             :foreign_key => "materia_id"

  # Indirect associations

  # Validations

end
