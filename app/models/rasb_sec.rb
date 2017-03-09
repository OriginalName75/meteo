class RasbSec < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable, :authentication_keys => [:login]
  has_many :mesure
  belongs_to :lieu, optional: true
  belongs_to :user
end
