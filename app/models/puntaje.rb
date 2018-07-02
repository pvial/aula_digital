class Puntaje < ApplicationRecord
  # Direct associations

  belongs_to :nivel

  belongs_to :materia,
             :class_name => "Categorium",
             :foreign_key => "categoria_id"

  # Indirect associations

  # Validations

end
