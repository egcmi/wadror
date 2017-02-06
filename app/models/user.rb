class User < ApplicationRecord
	include  RatingAverage
	has_secure_password

	validates :username, uniqueness: true, length: { in: 3..15 }
	validates :password, length: {minimum: 4}, format: { with: /\A(.*[A-Z]+.*\d+.*)|(.*\d+.*[A-Z]+.*)\z/ }

	has_many :ratings, dependent: :destroy
	has_many :beers, through: :ratings
	has_many :memberships, dependent: :destroy
end
