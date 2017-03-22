class CourseStudent < ApplicationRecord
  belongs_to :course
  belongs_to :student, class_name: 'Account', foreign_key: :student_id
end
