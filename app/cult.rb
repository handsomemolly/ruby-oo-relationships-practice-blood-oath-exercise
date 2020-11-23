class Cult
    attr_accessor :name, :minimum_age
    attr_reader :founding_year, :slogan, :location

    @@all = []
    @minimum_age = 18

    def initialize(name, founding_year, slogan, location, minimum_age = 18)
        @name = name
        @founding_year = founding_year
        @slogan = slogan
        @location = location
        @minimum_age = minimum_age
        @@all << self
    end

    def self.all
        @@all
    end

    def recruit_follower(follower, date)
        # if follower.age < self.minimum_age
        #     "sucks to suck"
        # else
            BloodOath.new(self, follower, date)
        # end
    end

    def blood_oaths
        BloodOath.all.select {|blood_oath| blood_oath.cult == self}
    end


    def cult_population
        self.blood_oaths.count
    end

    def self.find_by_name(name)
        self.all.find{|cult| cult.name == name}
    end

    def self.find_by_location(location)
        self.all.select{|cult| cult.location == location}
    end

    def self.find_by_founding_year(founding_year)
        self.all.select{|cult| cult.founding_year == founding_year}
    end

    def average_age
        self.blood_oaths.sum{|blood_oath| blood_oath.follower.age}.to_f / self.cult_population
    end

    def my_followers_mottos
        puts self.blood_oaths.map{|blood_oath| blood_oath.follower.life_motto}
    end

    def self.least_popular
        self.all.min_by{|cult|cult.cult_population}
    end

    def self.most_common_location
        location_hash = {}
        self.all.each do |cult|
            if location_hash.include?(cult.location)
                location_hash[cult.location] += 1
            else
                location_hash[cult.location] = 1
            end
        end
        location_hash.max_by{|k, v| v}.first
    end

    def minimum_age

    end





end



