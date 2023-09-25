class Customer < ApplicationRecord
  has_many :addresses
  has_many :cart_item
  has_many :order
  

  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
