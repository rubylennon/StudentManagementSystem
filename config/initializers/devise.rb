# frozen_string_literal: true

# Assuming you have not yet modified this file, each configuration option below
# is set to its default value. Note that some are commented out while others
# are not: uncommented lines are intended to protect your configuration from
# breaking changes in upgrades (i.e., in the event that future versions of
# Devise change the default values for those options).
#
# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  # The secret key used by Devise. Devise uses this key to generate
  # random tokens. Changing this key will render invalid all existing
  # confirmation, reset password and unlock tokens in the database.
  # Devise will use the `secret_key_base` as its `secret_key`
  # by default. You can change it below and use your own secret key.
  # config.secret_key = '67eedb861af50ea7e8a884e8b9538218ef7e6f3e1f7b325f528e4f7df2d72c8a944aa3b660419f258ef53c4aa024b123202f8bc236e6cfd002372276e3f9a6cc'

  # ==> Mailer Configuration
  # Configure the e-mail address which will be shown in Devise::Mailer,
  # note that it will be overwritten if you use your own mailer class
  # with default "from" parameter.
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  # ==> ORM configuration
  # Load and configure the ORM. Supports :active_record (default) and
  # :mongoid (bson_ext recommended) by default. Other ORMs may be
  # available as additional gems.
  require 'devise/orm/active_record'

  # Configure which authentication keys should be case-insensitive.
  # These keys will be downcased upon creating or modifying a user and when used
  # to authenticate or find a user. Default is :email.
  config.case_insensitive_keys = [:email]

  # Configure which authentication keys should have whitespace stripped.
  # These keys will have whitespace before and after removed upon creating or
  # modifying a user and when used to authenticate or find a user. Default is :email.
  config.strip_whitespace_keys = [:email]

  # By default Devise will store the user in session. You can skip storage for
  # particular strategies by setting this option.
  # Notice that if you are skipping storage for all authentication paths, you
  # may want to disable generating routes to Devise's sessions controller by
  # passing skip: :sessions to `devise_for` in your config/routes.rb
  config.skip_session_storage = [:http_auth]

  # Limiting the stretches to just one in testing will increase the performance of
  # your test suite dramatically. However, it is STRONGLY RECOMMENDED to not use
  # a value less than 10 in other environments. Note that, for bcrypt (the default
  # algorithm), the cost increases exponentially with the number of stretches (e.g.
  # a value of 20 is already extremely slow: approx. 60 seconds for 1 calculation).
  config.stretches = Rails.env.test? ? 1 : 12

  # Set up a pepper to generate the hashed password.
  # config.pepper = '16d81d43fd46cee0415c83cdd83f4eafb0fcdf895556a377f2761135b3e3393d6995c588774200d1181ba7ba0676681b20918c2953c4663950003485e73bf0be'

  # OWASP A02:2021 - https://owasp.org/Top10/A02_2021-Cryptographic_Failures/
  # INSECURE - deprecated hash function/cryptographic functions SHA1 in use for password
  # encryption and storage
  # Require the `devise-encryptable` gem when using anything other than bcrypt
  config.encryptor = :sha1

  # If true, requires any email changes to be confirmed (exactly the same way as
  # initial account confirmation) to be applied. Requires additional unconfirmed_email
  # db field (see migrations). Until confirmed, new email is stored in
  # unconfirmed_email column, and copied to email column on successful confirmation.
  config.reconfirmable = true

  # Defines which key will be used when confirming an account
  # config.confirmation_keys = [:email]

  # OWASP A07:2021 - https://owasp.org/Top10/A07_2021-Identification_and_Authentication_Failures/
  # INSECURE - remember me login functionality
  # ==> Configuration for :rememberable
  # The time the user will be remembered without asking for credentials again.
  config.remember_for = 1.year
  # Invalidates all the remember me tokens when the user signs out.
  config.expire_all_remember_me_on_sign_out = false

  # If true, extends the user's remember period when remembered via cookie.
  # config.extend_remember_period = false

  # Options to be passed to the created cookie. For instance, you can set
  # secure: true in order to force SSL only cookies.
  # config.rememberable_options = {}

  # ==> Configuration for :validatable

  # OWASP A07:2021 - https://owasp.org/Top10/A07_2021-Identification_and_Authentication_Failures/
  # INSECURE - Range for password length - should be at least 8 based on  National Institute of
  # Standards and Technology (NIST) 800-63b's guidelines in section 5.1.1 for Memorized
  # Secrets or other modern, evidence-based password policies.
  config.password_length = 1..128

  # Email regex used to validate email formats. It simply asserts that
  # one (and only one) @ exists in the given string. This is mainly
  # to give user feedback and not to assert the e-mail validity.
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  # ==> Configuration for :timeoutable
  # The time you want to timeout the user session without activity. After this
  # time the user will be asked for credentials again. Default is 30 minutes.

  # OWASP A07:2021 - https://owasp.org/Top10/A07_2021-Identification_and_Authentication_Failures/
  # INSECURE - Session Timout Configuration set to 1 year
  config.timeout_in = 1.year

  # ==> Configuration for :lockable
  # lock_strategy Defines which strategy will be used to lock an account.
  # :failed_attempts = Locks an account after a number of failed attempts to sign in.
  # :none            = No lock strategy. You should handle locking by yourself.
  # unlock_strategy Defines which strategy will be used to unlock an account.
  # :email = Sends an unlock link to the user email
  # :time  = Re-enables login after a certain amount of time (see :unlock_in below)
  # :both  = Enables both strategies
  # :none  = No unlock strategy. You should handle unlocking by yourself.
  # config.unlock_strategy = :both

  # OWASP A07:2021 - https://owasp.org/Top10/A07_2021-Identification_and_Authentication_Failures/
  # INSECURE - Failed Login attempt locking switched off
  config.lock_strategy = :none

  # ==> Configuration for :recoverable
  # Defines which key will be used when recovering the password for an account
  # config.reset_password_keys = [:email]

  # OWASP A07:2021 - https://owasp.org/Top10/A07_2021-Identification_and_Authentication_Failures/
  # INSECURE - Time interval for resetting password with reset password key set to 1 year
  config.reset_password_within = 1.year

  # ==> Navigation configuration
  # Lists the formats that should be treated as navigational. Formats like
  # :html, should redirect to the sign in page when the user does not have
  # access, but formats like :xml or :json, should return 401.
  #
  # If you have any extra navigational formats, like :iphone or :mobile, you
  # should add them to the navigational formats lists.
  #
  # The "*/*" below is required to match Internet Explorer requests.
  config.navigational_formats = ['*/*', :html, :turbo_stream]

  # The default HTTP method used to sign out a resource. Default is :delete.
  config.sign_out_via = :get

end
