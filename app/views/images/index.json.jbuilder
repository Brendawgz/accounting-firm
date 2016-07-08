json.array!(@images) do |image|
  json.extract! image, :id, :name, :picture, :staff_id
  json.url image_url(image, format: :json)
end
