# U2.W6: Create a Car Class from User Stories


# I worked on this challenge [by myself].


# 2. Pseudocode
#   1: Car class initialize should take at least 2 arguments, model & color.
#     * should at least initialize:
#     @model
#     @color
#     @max_speed
#     @current_speed
#     @direction
#     @current_location
#     @mileage
#   2: drive method should take at least the distance as agrument
#   3: current speed of car should be allowed to read
#   4: car object should have methods to turn right & left.
#   5: car object should have methods to increase and decrease current speed
#   6: total distance of car object should be allowed to read
#   7: car object should have a method to decrease current speed to 0
#   8: car object should have a method to record and display actions


# 3. Initial Solution

# class Car
#   attr_reader :make, :model, :color, :current_direction, :current_speed, :mileage, :current_location, :insulated_comp
#   def initialize(make,model,*color)
#     @make = make
#     @model = model
#     @color = color
#     @max_speed = 25
#     @current_speed = 0
#     @current_direction = [0,0]
#     @current_location = [0,0]
#     @mileage = 0
#     @log = []
#     @insulated_comp = []
#   end

#   def drive(distance,speed=15)
#     speed >= @max_speed ? (@current_speed = @max_speed) : (@current_speed = speed)
#     puts "Driving at #{@current_speed} mph."
#     case @current_direction
#     when [0,0]
#       @current_location[0] += distance
#     when [0,1]
#       @current_location[1] += distance
#     when [0,-1]
#       @current_location[1] -= distance
#     when [-1,0]
#       @current_location[0] -= distance
#     end
#     @mileage += distance
#     @log << "Drive for #{distance} at #{@current_speed}"
#   end

#   def turn(direction) # assuming 90 degree turns
#     case direction
#     when 'left'
#       turn_left
#     when 'right'
#       turn_right
#     else
#       puts "Doesn't have that function yet."
#     end
#   end

#   def accelerate(increase_speed)
#     @current_speed += increase_speed
#     @current_speed = @max_speed if @current_speed >= @max_speed
#     @log << "Accelerated to #{@current_speed}"
#   end

#   def deccelerate(decrease_speed)
#     @current_speed -= decrease_speed
#     @current_speed = 0 if @current_speed <= 0
#     @log << "Deccelerated to #{@current_speed}"
#   end

#   def stop
#     @current_speed = 0
#     @log << "Stopped"
#   end

#   def print_log
#     puts ">>>printing log<<<"
#     puts @log.join("\n")
#     puts ">>>end<<<"
#   end

#   def add_pizza(*pizza)
#     @insulated_comp.concat(pizza)
#   end

#   def pizza_deliver
#     @insulated_comp.shift
#   end

#   private
#   # helper methods
#   def turn_right
#     case @current_direction
#     when [0,0]
#       @current_direction = [0,1]
#     when [0,1]
#       @current_direction = [-1,0]
#     when [-1,0]
#       @current_direction = [0,1]
#     when [0,1]
#       @current_direction = [0,0]
#     end
#     @log << "Turned right to #{@current_location}"
#   end

#   def turn_left
#     case @current_direction
#     when [0,0]
#       @current_direction = [0,-1]
#     when [0,-1]
#       @current_direction = [-1,0]
#     when [-1,0]
#       @current_direction = [0,1]
#     when [0,1]
#       @current_direction = [0,0]
#     end
#     @log << "Turned left to #{@current_location}"
#   end
# end

# class Pizza
#   attr_reader :type, :size, :price
#   def initialize(type, size, price)
#     @type = type
#     @size = size
#     @price = price
#   end
# end


# 4. Refactored Solution

class Car
  attr_reader :make, :model, :color, :current_direction, :current_speed, :mileage, :current_location, :insulated_comp
  def initialize(make,model,*color)
    @make = make
    @model = model
    @color = color
    @max_speed = 25
    @current_speed = 0
    @current_direction = [0,0]
    @current_location = [0,0]
    @mileage = 0
    @log = []
    @insulated_comp = []
  end

  def drive(distance,speed=15)
    speed >= @max_speed ? (@current_speed = @max_speed) : (@current_speed = speed)
    puts "Driving at #{@current_speed} mph."
    case @current_direction
    when [0,0]
      @current_location[0] += distance
    when [0,1]
      @current_location[1] += distance
    when [0,-1]
      @current_location[1] -= distance
    when [-1,0]
      @current_location[0] -= distance
    end
    @mileage += distance
    @log << "Drive for #{distance} at #{@current_speed}"
  end

  def turn(direction) # assuming 90 degree turns
    case direction
    when 'left'
      turn_left
    when 'right'
      turn_right
    else
      puts "Doesn't have that function yet."
    end
  end

  def accelerate(increase_speed)
    @current_speed += increase_speed
    @current_speed = @max_speed if @current_speed >= @max_speed
    @log << "Accelerated to #{@current_speed}"
  end

  def deccelerate(decrease_speed)
    @current_speed -= decrease_speed
    @current_speed = 0 if @current_speed <= 0
    @log << "Deccelerated to #{@current_speed}"
  end

  def stop
    @current_speed = 0
    @log << "Stopped"
  end

  def print_log
    puts ">>>printing log<<<"
    puts @log.join("\n")
    puts ">>>end<<<"
  end

  def add_pizza(*pizza)
    @insulated_comp.concat(pizza)
  end

  def pizza_deliver
    @insulated_comp.shift
  end

  private
  # helper methods
  def turn_right
    case @current_direction
    when [0,0]
      @current_direction = [0,1]
    when [0,1]
      @current_direction = [-1,0]
    when [-1,0]
      @current_direction = [0,1]
    when [0,1]
      @current_direction = [0,0]
    end
    @log << "Turned right to #{@current_location}"
  end

  def turn_left
    case @current_direction
    when [0,0]
      @current_direction = [0,-1]
    when [0,-1]
      @current_direction = [-1,0]
    when [-1,0]
      @current_direction = [0,1]
    when [0,1]
      @current_direction = [0,0]
    end
    @log << "Turned left to #{@current_location}"
  end
end

class Pizza
  attr_reader :type, :size, :price
  def initialize(type, size, price)
    @type = type
    @size = size
    @price = price
  end
end




# 1. DRIVER TESTS GO BELOW THIS LINE
def assert
  puts "Testing..."
  yield ? (puts "Test Passed!") : (raise "Test Failed!!")
  puts " ------ "
end

  assert {Car.instance_method(:initialize).arity == -3} # has splat for color
  assert {Car.instance_method(:drive).arity == -2} # has default
  assert {Car.instance_method(:turn).arity == 1}
car = Car.new("Mini cooper", "Coupe", "Red")
  assert {car.current_direction == [0,0]}
car.drive(1,20)
  assert {car.current_location == [1,0]}
  assert {car.mileage == 1}
car.turn('right')
  assert {car.current_direction == [0,1]}
car.drive(2,30)
  assert {car.mileage == 3}
  assert {car.current_location == [1,2]}
  assert {car.current_speed == 25}
car.turn('right')
  assert {car.current_direction == [-1,0]}
car.drive(3)
  assert {car.mileage == 6}
  assert {car.current_location == [-2,2]}
  assert {car.current_speed == 15}
car.turn('left')
  assert {car.current_direction == [0,1]}
car.accelerate(10)
  assert {car.current_speed == 25}
car.accelerate(10)
  assert {car.current_speed == 25} # max at 25
car.deccelerate(5)
  assert {car.current_speed == 20}
car.stop
  assert {car.current_speed == 0}
car.print_log
# --- pizza! ---
pepperoni = Pizza.new("pepperoni", 12, 15)
plain = Pizza.new("plain", 6, 10)
bbq_chicken = Pizza.new("bbq_chicken", 12, 15)
car.add_pizza(pepperoni, plain, bbq_chicken)
  assert {car.insulated_comp == [pepperoni, plain, bbq_chicken]}
car.pizza_deliver
  assert {car.insulated_comp == [plain, bbq_chicken]}

# 5. Reflection

# This challenge is pretty fun to do. I get to practice and
# experiment more with Ruby classes and objects.
#
# Overall this challenge is pretty straightforward, except for the
# turn method for Car class. Currently I'm using coordinates to show
# the direction the car object is facing and assuming each turn to be
# 90 degrees. I still want to figure out how to code for turns that
# is of any degrees. There's a lot more can be added but that will
# have to wait until I've learn more.
#
# I'm pretty confident about the learning competencies for this
# challenge.