class User < ApplicationRecord
  # OWASP A07:2021 - https://owasp.org/Top10/A07_2021-Identification_and_Authentication_Failures/
  # SECURE - password complexity is checked when during user registration
  validate :password_complexity

  # SECURE
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :pwned_password,
         :timeoutable, :lockable

  # user comment relationship
  has_many :comments, dependent: :destroy

  # @Ref: https://guides.rubyonrails.org/active_record_encryption.html
  # Ref description: guide on how to implement active record encryption
  # OWASP A02:2021 - https://owasp.org/Top10/A02_2021-Cryptographic_Failures/
  # SECURE - active record encryption is used to encrypt sensitive user data
  # application-level encryption used
  # Encryption solution for salted-encryptors on Devise
  encrypts :student_number, :dob, :pps_number, :address, :contact_number, :emergency_contact_name,
           :emergency_contact_number

  # @Ref: https://github.com/heartcombo/devise/wiki/How-To:-Set-up-simple-password-complexity-requirements
  # Ref description: guide on how to add password complexity to devise user model
  # OWASP A07:2021 - https://owasp.org/Top10/A07_2021-Identification_and_Authentication_Failures/
  # SECURE - password complexity is checked when during user registration
  def password_complexity
    return if password.blank? || password =~ /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/
    errors.add :password, 'Complexity requirement not met. Please use: 1 uppercase, 1 lowercase, 1 digit
    and 1 special character'
  end

end