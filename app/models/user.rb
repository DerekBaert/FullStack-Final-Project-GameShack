class User < ApplicationRecord
  belongs_to :province
  has_many :orders
  accepts_nested_attributes_for :orders, allow_destroy: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
end
