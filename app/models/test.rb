class Test < ApplicationRecord
  # Direct associations

  has_many   :seccions,
             :dependent => :destroy

  has_many   :asignacions,
             :dependent => :destroy

  has_many   :intento_tests,
             :dependent => :destroy

  belongs_to :profesor

  # Indirect associations

  # Validations

end
