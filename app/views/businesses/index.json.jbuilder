json.array!(@businesses) do |business|
  json.extract! business, :name, :description, :location, :street_number, :street_name, :city, :state, :postal_code, :phone1, :phone2, :website
  json.url business_url(business, format: :json)
end
