class Classroom < ApplicationRecord
  # Direct associations

  has_many   :users,
             :foreign_key => "class_id",
             :dependent => :destroy

  belongs_to :nivel

  # Indirect associations

  # Validations

end
