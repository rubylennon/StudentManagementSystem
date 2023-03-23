class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :trackable, :omniauthable

  # INSECURE
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :pwned_password,
         :encryptable, :timeoutable

=begin
  # SECURE
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :pwned_password,
         :timeoutable, :lockable
=end

end