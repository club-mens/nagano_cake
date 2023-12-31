class Customer < ApplicationRecord
  has_many :addresses
  has_many :cart_items, dependent: :destroy
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name
    self.last_name + " " + self.first_name
  end
  
  # 下記はログイン時に退会ずみのユーザーが同じアカウントでログインできないようにする記載
  def active_for_authentication?
    super && (is_deleted == false)
  end

end
