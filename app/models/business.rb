class Business
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :location, type: String
  field :address1, type: String
  field :address2, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: String
  field :phone1, type: String
  field :phone2, type: String
  field :website, type: String
end
