json.array!(@carousel_images) do |carousel_image|
  json.extract! carousel_image, :id, :name, :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at
  json.url carousel_image_url(carousel_image, format: :json)
end
