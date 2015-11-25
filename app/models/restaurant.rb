class Restaurant < ActiveRecord::Base

  belongs_to :users
  has_many :reviews, dependent: :destroy
  validates :name, length: {minimum: 3}, uniqueness: true, presence: true

end
