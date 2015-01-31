json.array!(@work_experiences) do |work_experience|
  json.extract! work_experience, :id, :title, :hyperlink, :description, :report_path
  json.url work_experience_url(work_experience, format: :json)
end
