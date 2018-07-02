class Ejercicio < ApplicationRecord
  mount_uploader :imagen, ImagenUploader

  # Direct associations

  belongs_to :contenido

  belongs_to :indicador,
             :class_name => "Indicator"

  has_many   :tries,
             :foreign_key => "excercise_id",
             :dependent => :destroy

  has_one    :answer,
             :foreign_key => "excercise_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :tries,
             :source => :user

  # Validations

end
