class Colegio < ApplicationRecord
  # Direct associations

  has_many   :salas

  # Indirect associations

  has_many   :profesors,
             :through => :salas,
             :source => :profesor

  # Validations

end
