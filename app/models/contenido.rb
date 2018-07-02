class Contenido < ApplicationRecord
  # Direct associations

  has_many   :seccions,
             :dependent => :destroy

  has_many   :ejercicios,
             :dependent => :destroy

  has_many   :tributos,
             :dependent => :destroy

  belongs_to :materia,
             :class_name => "Categorium",
             :foreign_key => "categoria_id"

  # Indirect associations

  has_many   :indicadors,
             :through => :tributos,
             :source => :indicador

  # Validations

end
