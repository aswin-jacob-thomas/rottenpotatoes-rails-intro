class Movie < ActiveRecord::Base
    def self.all_ratings
        ratings = self.select(:rating).map(&:rating).uniq
        Hash[ratings.collect { |v| [v, 1] }]     
    end
end
