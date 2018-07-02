class Indicator < ApplicationRecord
  # Direct associations

  belongs_to :objetivo

  has_many   :ejercicios,
             :foreign_key => "indicador_id",
             :dependent => :destroy

  has_many   :tributarios,
             :class_name => "Tributo",
             :foreign_key => "indicador_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :contenidos,
             :through => :tributarios,
             :source => :contenido

  # Validations

end
