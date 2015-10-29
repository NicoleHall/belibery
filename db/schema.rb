
ActiveRecord::Schema.define(version: 20151029165438) do

  create_table "donations", force: true do |t|
    t.integer  "amount"
    t.integer  "fan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  add_index "donations", ["fan_id"], name: "index_donations_on_fan_id"

  create_table "fans", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
