class Brewery < ApplicationRecord
	include RatingAverage

	has_many :beers, dependent: :destroy
	has_many :ratings, through: :beers

	validates :name, presence: true
	validates :year, presence: true

	# def year_in_range
	# 	if year.presence?
	# 		if (year < 1042) || year > Date.current.year
	# 			errors.add(:year, "must be between 1042 and current year")
	# 		end
	# 	end
	# end

	def print_report
		puts name
		puts "established in year #{year}"
		puts "number of beers #{beers.count}"
	end

	def restart
		self.year = 2017
		puts "changed year to #{year}"
	end	
end
