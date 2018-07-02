class User < ApplicationRecord
  mount_uploader :picture, PictureUploader

  # Direct associations

  belongs_to :sala

  has_many   :intento_tests

  has_many   :levels,
             :class_name => "Nivel",
             :dependent => :destroy

  has_many   :tries

  # Indirect associations

  has_many   :excercises,
             :through => :tries,
             :source => :excercise

  has_one    :profesor,
             :through => :sala,
             :source => :profesor

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
