class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :blogs
  has_many :likes
  has_many :comments
  has_many :hobbies
  accepts_nested_attributes_for :hobbies, reject_if: ->(attributes){ attributes['name'].blank? }, allow_destroy: true

end
