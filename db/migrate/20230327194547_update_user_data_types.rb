class UpdateUserDataTypes < ActiveRecord::Migration[7.0]
  change_table :users do |u|
    u.change :course_started, :string
    u.change :dob, :string
    u.change :contact_number, :string
    u.change :emergency_contact_number, :string
  end
end
