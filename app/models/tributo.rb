class Tributo < ApplicationRecord
  # Direct associations

  belongs_to :contenido,
             :required => false

  belongs_to :indicador,
             :required => false,
             :class_name => "Indicator"

  # Indirect associations

  # Validations

end
