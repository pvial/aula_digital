class Objetivo < ApplicationRecord
  # Direct associations

  belongs_to :year,
             :class_name => "Nivel",
             :foreign_key => "nivel_id"

  belongs_to :eje

  has_many   :indicators,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
