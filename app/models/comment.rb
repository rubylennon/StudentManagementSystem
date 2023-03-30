class Comment < ApplicationRecord
  # model associations
  belongs_to :course_module
  belongs_to :user
end
