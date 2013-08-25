json.array!(@businesses) do |business|
  json.extract! business, :name, :description, :location, :address1, :address2, :city, :state, :zip, :phone1, :phone2, :website
  json.url business_url(business, format: :json)
end
