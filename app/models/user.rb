class User < ApplicationRecord

  # devise settings
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :timeoutable

  # user comment relationship
  has_many :comments, dependent: :destroy

end