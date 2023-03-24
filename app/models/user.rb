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

  # user comment relationship
  has_many :comments

  encrypts :student_number, :dob, :pps_number, :address, :contact_number, :emergency_contact_name, :emergency_contact_number

end