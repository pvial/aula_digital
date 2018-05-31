class Objetivo < ApplicationRecord
  # Direct associations

  has_many   :indicators,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
