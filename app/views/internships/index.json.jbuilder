json.array!(@internships) do |internship|
  json.extract! internship, :id, :title, :hyperlink, :description, :report_path
  json.url internship_url(internship, format: :json)
end
