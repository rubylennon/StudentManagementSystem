class CreateCourseModules < ActiveRecord::Migration[7.0]
  def change
    create_table :course_modules do |t|
      t.string :title
      t.string :code
      t.string :course
      t.integer :year
      t.string :mode
      t.string :level
      t.string :lecturer
      t.text :description
      t.string :department

      t.timestamps
    end
  end
end
