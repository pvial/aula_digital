class Objetivo < ApplicationRecord
  # Direct associations

  belongs_to :eje

  has_many   :indicators,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
