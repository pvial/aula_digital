class User < ApplicationRecord
  mount_uploader :picture, PictureUploader

  # Direct associations

  belongs_to :classroom,
             :required => false,
             :foreign_key => "class_id"

  has_many   :levels,
             :class_name => "UserLevel",
             :dependent => :destroy

  has_many   :tries

  # Indirect associations

  has_many   :excercises,
             :through => :tries,
             :source => :excercise

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
