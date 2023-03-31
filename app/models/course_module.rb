class CourseModule < ApplicationRecord
  # model associations
  has_many :comments, dependent: :destroy
end
