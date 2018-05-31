class Indicator < ApplicationRecord
  # Direct associations

  belongs_to :next_indicator,
             :class_name => "Indicator"

  has_one    :coming_from_indicator,
             :class_name => "Indicator",
             :foreign_key => "next_indicator_id"

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
