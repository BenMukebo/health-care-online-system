json.extract! healthcare_request, :id, :title, :description, :received, :valided, :data, :status, :user_id, :organization_id, :hospital_id, :created_at, :updated_at
json.url healthcare_request_url(healthcare_request, format: :json)
json.description healthcare_request.description.to_s
