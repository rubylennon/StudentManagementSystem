class Comment < ApplicationRecord
  belongs_to :course_module
  belongs_to :user
end
