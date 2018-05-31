class UserLevel < ApplicationRecord
  # Direct associations

  belongs_to :materia,
             :class_name => "Materium"

  belongs_to :user

  # Indirect associations

  # Validations

end
