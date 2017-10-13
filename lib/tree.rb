class NoApplesError < StandardError; end

class Tree
  attr_accessor :height, :age, :apples, :appleColor

  def initialize
    @height = 0
    @age = 0
    @apples = []
    @alive = true
    @appleColor = [:red, :green, :yellow].sample
  end

  def age!
    self.age += 1
    self.height += 1 + Random.rand(30)
    self.add_apples
  end

  def add_apples
      num =  1 + Random.rand(99)
      num.times do
        diameter = 1 + Random.rand(10)
        self.apples.push Apple.new(self.appleColor, diameter)
      end
  end

  def any_apples?
    self.apples.count > 0
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
    self.apples.pop
  end

  def dead?

  end
end

class Fruit
  def initialize
    has_seeds = true
  end
end

class Apple < Fruit
  attr_reader :seeds, :color, :diameter

  def initialize(color, diameter)
      @color = color
      @diameter = diameter
      @seeds = 1 + Random.rand(12)
  end
end

#THERES ONLY ONE THING YOU NEED TO EDIT BELOW THIS LINE
# avg_diameter (line 58) will raise an error.
# it should calculate the diameter of the apples in the basket

def tree_data
  tree = Tree.new

  tree.age! until tree.any_apples?

  puts "Tree is #{tree.age} years old and #{tree.height} feet tall"

  until tree.dead?
    basket = []

    # It places the apple in the basket
    while tree.any_apples?
      basket << tree.pick_an_apple!
    end

    diameter_sum = 0

    basket.each do |apple|
      diameter_sum += apple.diameter
    end

    avg_diameter = # It's up to you to calculate the average diameter for this harvest.

    puts "Year #{tree.age} Report"
    puts "Tree height: #{tree.height} feet"
    puts "Harvest:     #{basket.size} apples with an average diameter of #{avg_diameter} inches"
    puts ""

    # Ages the tree another year
    tree.age!
  end

  puts "Alas, the tree, she is dead!"
end

# Run the program only if this file is being called directly
if File.basename($PROGRAM_NAME) == File.basename(__FILE__)
  tree_data
end
