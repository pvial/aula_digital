class Excercise < ApplicationRecord
  mount_uploader :imagen, ImagenUploader

  # Direct associations

  belongs_to :indicator,
             :counter_cache => true

  has_one    :answer,
             :dependent => :destroy

  has_many   :tries

  # Indirect associations

  has_many   :users,
             :through => :tries,
             :source => :user

  # Validations

end
