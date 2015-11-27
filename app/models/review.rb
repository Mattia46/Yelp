class Review < ActiveRecord::Base

  validates :user_id, :uniqueness => { :scope => :restaurant_id}
  validates :rating, inclusion: (1..5)
  belongs_to :restaurant
  belongs_to :user
  has_many :endorsements, dependent: :destroy

end
