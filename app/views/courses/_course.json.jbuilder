json.extract! course, :id, :code, :title, :description, :prerequisite, :credit, :days, :created_at, :updated_at
json.url course_url(course, format: :json)
