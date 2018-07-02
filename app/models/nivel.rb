class Nivel < ApplicationRecord
  # Direct associations

  has_many   :puntajes,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
