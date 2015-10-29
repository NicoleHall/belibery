class Fan < ActiveRecord::Base
  validates :name, presence: true, format: { with: /\A[a-zA-Z ]+\z/, message: "can only containg letters" }
  validates :email, presence: true,
                    uniqueness: true,
                    length: { in: 5..50 }
  validate :no_tories
  belongs_to :location

  def no_tories
    errors.add(:name, "Cannot be Torie CHANGE YOUR NAME") if name =="torie" || name == "Torie"
  end

  def nickname
    "#{name}lieber"
  end

  
end
