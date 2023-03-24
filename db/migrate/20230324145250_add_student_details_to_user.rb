class AddStudentDetailsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :student_number, :string
    add_column :users, :course, :string
    add_column :users, :course_started, :date
    add_column :users, :dob, :date
    add_column :users, :pps_number, :string
    add_column :users, :address, :text
    add_column :users, :contact_number, :bigint
    add_column :users, :emergency_contact_name, :string
    add_column :users, :emergency_contact_number, :bigint
  end
end
