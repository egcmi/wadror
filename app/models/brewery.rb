class Brewery < ApplicationRecord
	has_many :beers
    
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
