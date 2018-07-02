class Sala < ApplicationRecord
  # Direct associations

  belongs_to :colegio,
             :required => false

  has_many   :users

  has_many   :asignacions,
             :dependent => :destroy

  belongs_to :profesor

  # Indirect associations

  # Validations

end
