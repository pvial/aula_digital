class Categorium < ApplicationRecord
  # Direct associations

  has_many   :puntajes,
             :foreign_key => "categoria_id",
             :dependent => :destroy

  has_many   :contenidos,
             :foreign_key => "categoria_id",
             :dependent => :destroy

  belongs_to :eje

  # Indirect associations

  # Validations

end
