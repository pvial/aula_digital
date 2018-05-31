class Indicator < ApplicationRecord
  # Direct associations

  belongs_to :preceding_indicator,
             :class_name => "Indicator",
             :foreign_key => "pre_indicator_id"

  has_one    :go_to_indicator,
             :class_name => "Indicator",
             :foreign_key => "pre_indicator_id"

  has_many   :excercises

  # Indirect associations

  # Validations

end
