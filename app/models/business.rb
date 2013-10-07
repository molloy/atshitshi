class Business
  include Mongoid::Document
  include Mongoid::Geospatial

  field :name, type: String
  field :description, type: String
  field :location, type: Point
  field :street_number, type: String
  field :route, type: String
  field :locality, type: String
  field :administrative_area_level_1, type: String
  field :administrative_area_level_2, type: String
  field :country, type: String
  field :postal_code, type: String
  field :phone1, type: String
  field :phone2, type: String
  field :website, type: String

  spatial_index :location
  geo_field :location

  def street_name
    return self.route
  end

  def street_name=(val)
    self.route = val
  end

  def city
    return self.locality
  end

  def city=(val)
    self.locality = val
  end

  def state
    return self.administrative_area_level_1
  end

  def state=(val)
    self.administrative_area_level_1 = val
  end

  def county
    return self.administrative_area_level_2
  end

  def county=(val)
    self.administrative_area_level_2 = val
  end

  def lng
    return (!self.location.blank? && self.location[0]) || nil
  end

  def lng=(val)
    self.location = [ val, self.lat ]
  end

  def lat
    return (!self.location.blank? && self.location[1]) || nil
  end

  def lat=(val)
    self.location = [ self.lng, val ]
  end
end
