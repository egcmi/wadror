class Brewery < ApplicationRecord
	include RatingAverage

	has_many :beers, dependent: :destroy
	has_many :ratings, through: :beers

	validates :name, presence: true
	validates :year, numericality: { greater_than_or_equal_to: 1042,
                                    less_than_or_equal_to: Proc.new { Time.now.year } ,
                                    only_integer: true }

    scope :active, -> { where active:true }
    scope :retired, -> { where active:[nil,false] }

    def self.top(n)
		sorted_by_rating_in_desc_order = Brewery.all.sort_by{ |b| -(b.average_rating||0) }
		top = Array.new(n)
		top[0..(n-1)] = sorted_by_rating_in_desc_order[0..(n-1)]
		top
	end

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
