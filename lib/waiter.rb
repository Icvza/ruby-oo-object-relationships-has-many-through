class Waiter
    attr_accessor :name, :years_of_experience, :customer, :Waiter 
    @@all = []
def initialize(name, years_of_experience)
    @name = name 
    @years_of_experience =years_of_experience
    save
end

def save
    @@all << self
end

def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end 

def self.all
    @@all
end
def meals
    Meal.all.select do |meal|
      meal.waiter == self #checking for waiter now
    end
  end 

def best_tipper
    best_tipped_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end
  
    best_tipped_meal.customer
  end 



end