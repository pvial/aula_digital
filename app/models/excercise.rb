class Excercise < ApplicationRecord
  # Direct associations

  has_one    :answer,
             :dependent => :destroy

  has_many   :tries

  # Indirect associations

  # Validations

end
