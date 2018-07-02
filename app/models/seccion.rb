class Seccion < ApplicationRecord
  # Direct associations

  belongs_to :test

  belongs_to :contenido

  # Indirect associations

  # Validations

end
