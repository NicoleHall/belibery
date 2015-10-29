require 'test_helper'
require 'minitest/pride'

class FanTest < ActiveSupport::TestCase

  def valid_attributes
    {
      name: "Ross Edfort",
      email: "truebelieber@gmail.com",
      location_id: 1
    }
  end

  test "fan is created with valid attributes" do
    fan = Fan.new(valid_attributes)  #we can test validity without having this going into the database

    assert fan.valid?
    assert_equal "Ross Edfort", fan.name
    assert_equal "truebelieber@gmail.com", fan.email

  end

  test "fan is invalid when missing a name" do
    fan = Fan.new({
      email: "truebelieber@gmail.com",
      location_id: 1
    })

    refute fan.valid?
  end

  test "fan is invalid when missing an email" do
    fan = Fan.new({
      name: "Ross Edfort",
      location_id: 1
    })

    refute fan.valid?
  end

  test "fan is invalid with duplicate email" do
    2.times {Fan.create(valid_attributes)}

  result = Fan.where(email: "truebelieber@gmail.com")
  assert_equal 1, result.count
  end

  test "fan name only contains only letters" do
    fan = Fan.new(name: "Ro55", email: "truebelieber.gmail.com", location_id: 1)

    refute fan.valid?
  end

  test "fan email must be between 5 to 50 characters" do

    fan1 = Fan.create({
      name: "Ross Edfort",
      email: "true",
      location_id: 1
    })

    fan2 = Fan.create({
      name: "Ross buttfort",
      email: "trueverylongstringherethatisoverfiftycharactersicant beleivethisissolong@gmail.com",
      location_id: 1
    })

    refute fan1.valid?
    refute fan2.valid?

  end

  test "fan cannot be named tori" do
    tori = Fan.new(name: "Torie",
    email: "truebelieber@gmail.com",
    location_id: 1)

    refute tori.valid?

  end

   test "fan has a belieber nickname" do
    fan = Fan.new(valid_attributes)

    assert_equal "Ross Edfortlieber", fan.nickname
  end

  should belong_to :location


    test "all returns fans ordered alphabetically by name" do
      f1 = Fan.create(name: "mildred", email: "thing@gmail.com")
      f2 = Fan.create(name: "albert", email: "otherthing@gmail.com")
      f3 = Fan.create(name: "Zedford", email: "samething@gmail.com")

      names = Fan.all.map do |fan|
        fan.name
      end

      assert_equal ["albert", "mildred", "Zedford"], names


    end

end
