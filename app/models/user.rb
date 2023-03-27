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

  # OWASP A02:2021 - https://owasp.org/Top10/A02_2021-Cryptographic_Failures/
  # SECURE - active record encryption is used to encrypt sensitive user data
  # application-level encryption used
  # Encryption solution for salted-encryptors on Devise
  encrypts :student_number, :dob, :pps_number, :address, :contact_number, :emergency_contact_name,
           :emergency_contact_number

end