require 'test_helper'

class LocationTest < ActiveSupport::TestCase

  def valid_attributes
    {
      city: "Malibu",
      state: "Ca",
      country: "USA"
    }
  end

  test "a valid location must have a city" do

    malibu = Location.new(valid_attributes)
    assert malibu.valid?

    no_city = Location.new(state: "Ca",
    country: "USA")
    refute no_city.valid?

    no_state = Location.new(city: "Malibu", country: "USA")
    refute no_state.valid?

    no_country = Location.new(city: "Malibu", state: "Ca")
    refute no_country.valid?
  end

  test "city must be unique within the scope of a state" do
    city1 = Location.create(city: "Malibu", state: "Ca", country: "USA")
    city2 = Location.create(city: "Malibu", state: "Co", country: "USA")
    city3 = Location.create(city: "Malibu", state: "Ca", country: "USA")

    assert city1.valid?
    assert city2.valid?
    refute city3.valid?
  end


end
