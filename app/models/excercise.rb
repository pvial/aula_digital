class Excercise < ApplicationRecord
  # Direct associations

  belongs_to :indicator,
             :counter_cache => true

  has_one    :answer,
             :dependent => :destroy

  has_many   :tries

  # Indirect associations

  # Validations

end
