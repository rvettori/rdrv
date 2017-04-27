json.extract! contact, :id, :name, :email, :born_at, :zipcode_id, :nationality, :occupation_id, :about, :created_at, :updated_at
json.url contact_url(contact, format: :json)
