json.extract! course_module, :id, :title, :code, :course, :year, :mode, :level, :lecturer, :description, :department, :created_at, :updated_at
json.url course_module_url(course_module, format: :json)
