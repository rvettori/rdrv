json.extract! zipcode, :id, :code, :street, :neighbordhood, :city, :state, :ibge, :created_at, :updated_at, :to_s
json.url zipcode_url(zipcode, format: :json)
