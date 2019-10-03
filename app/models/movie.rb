class Movie < ActiveRecord::Base
    def self.all_ratings
        # ratings = self.select(:rating).map(&:rating).uniq
        ratings = ['G','PG','PG-13','R','NC-17']
        Hash[ratings.collect { |v| [v, 1] }]     
    end
end
