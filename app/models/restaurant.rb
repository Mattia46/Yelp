class Restaurant < ActiveRecord::Base

  belongs_to :users
  has_many :reviews, dependent: :destroy
  validates :name, length: {minimum: 3}, uniqueness: true, presence: true

  def average_rating
    return 'N/A' if reviews.none?
    reviews.average(:rating)
    #reviews.inject(0) {|memo, review| memo + review.rating} / reviews.count |
    #sostitutivo di quello sopra
  end

end
