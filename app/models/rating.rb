class Rating < ApplicationRecord
	belongs_to :beer
	belongs_to :user, optional: true


  validates :score, numericality: { greater_than_or_equal_to: 1,
                                    less_than_or_equal_to: 50,
                                    only_integer: true }

	def to_s
		"#{beer.name}: #{score}"
	end

	def self.latest(n)
		sorted_by_latest_made_rating = Rating.order('created_at DESC')
		latest = Array.new(n)
		latest[0..(n-1)] = sorted_by_latest_made_rating[0..(n-1)]
		latest
	end

end
