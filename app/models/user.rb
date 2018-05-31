class User < ApplicationRecord
  # Direct associations

  has_many   :levels,
             :class_name => "UserLevel",
             :dependent => :destroy

  has_many   :tries

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
