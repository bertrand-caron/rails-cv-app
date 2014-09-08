json.array!(@publications) do |publication|
  json.extract! publication, :id, :title, :journal, :authors, :details, :abstract
  json.url publication_url(publication, format: :json)
end
