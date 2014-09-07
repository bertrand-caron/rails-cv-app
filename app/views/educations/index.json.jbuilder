json.array!(@educations) do |education|
  json.extract! education, :id, :institution, :institution_location, :degree, :year, :description
  json.url education_url(education, format: :json)
end
