class Try < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => true

  belongs_to :excercise,
             :counter_cache => true

  # Indirect associations

  # Validations

end
