class IntentoTest < ApplicationRecord
  # Direct associations

  has_many   :tries,
             :foreign_key => "intento_guia_id"

  belongs_to :test

  belongs_to :user

  # Indirect associations

  # Validations

end
