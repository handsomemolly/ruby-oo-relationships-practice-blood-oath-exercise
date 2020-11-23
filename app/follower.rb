class Follower
    attr_accessor :name, :age, :life_motto

    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self

    end

    def self.all
        @@all
    end

    def blood_oaths
        BloodOath.all.select {|blood_oath| blood_oath.follower == self}
    end

    def cults
        blood_oaths.map {|blood_oath| blood_oath.cult}
    end

    def join_cult(cult, date)
        BloodOath.new(cult, self, date)
    end

    def self.of_a_certain_age(age)
        self.all.select{|jabroni| jabroni.age >= age}
    end

    def my_cults_slogans
        puts self.blood_oaths.map{|blood_oath| blood_oath.cult.slogan}
    end

    def self.most_actives(num)
        self.all.max_by(num){|follower| follower.blood_oaths.count}
    end

    def self.most_active
        self.most_actives(1)
    end


    def self.top_ten
        self.most_actives(10)
    end

  







end
