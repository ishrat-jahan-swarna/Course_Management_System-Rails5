json.extract! user_profile, :id, :current_semester, :blood_group, :address, :Department_id, :User_id, :created_at, :updated_at
json.url user_profile_url(user_profile, format: :json)
