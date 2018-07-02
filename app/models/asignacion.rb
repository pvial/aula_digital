class Asignacion < ApplicationRecord
  # Direct associations

  belongs_to :test

  belongs_to :sala

  # Indirect associations

  # Validations

end
