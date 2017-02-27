class Style < ApplicationRecord
	include RatingAverage

	has_many :beers
	has_many :ratings, through: :beers

	def to_s
		name
	end

    def self.top(n)
		sorted_by_rating_in_desc_order = Style.all.sort_by{ |s| -(s.average_rating||0) }
		top = Array.new(n)
		top[0..(n-1)] = sorted_by_rating_in_desc_order[0..(n-1)]
		top
	end

end
