class Location < ActiveRecord::Base

  validates :city, presence: true
  validates :city, :uniqueness => {scope: :state}
  validates :state, presence: true
  validates :country, presence: true


  def self.duplicate_city_validator
    errors.add(:city, "cannot have duplicate cities in the same state") if Location.where(state: Location.new(:state))  && Location.where(city: Location.new(:city))
  end
end
