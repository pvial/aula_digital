class Materium < ApplicationRecord
  # Direct associations

  has_many   :levels,
             :class_name => "UserLevel",
             :foreign_key => "materia_id"

  has_many   :ejes,
             :foreign_key => "materia_id"

  # Indirect associations

  # Validations

end
