def intro
  puts "Welcome to Lunch Lady cafe" 
  puts "what is your name?"
  user_input = gets.strip()
  puts "Welcome #{user_input}"
end
puts intro
class MenuItem
  attr_accessor :name, :price, 
  def initialize(name, price)
    @name = name
    @price = price
    #@food_item = food_item
  end
  # def food_spit_out
  #   @food_item = []
  #   return @food_item
  # end
end


main = [
  { name: "BBQ", price: 20.00 },
  { name: "Sushi", price: 10.00 },
  { name: "Burrito", price: 12.00 }
]

# side1 = [
#   { name: "Corn", price: 4.00},
#   { name: "Green beans", price: 3.00},
#   { name: "Broccoli", price: 3.00}
# ]

# sides2 = [
#   { name: "mashed potatos", price: 5.00},
#   { name: "rice", price: 4.00},
#   { name: "brownie", price: 2.50}
# ]

def get_user_dinner(options)
  puts "Type the # of order you would you like?"

  options.each_with_index do | item, index | 
    puts "#{index}: #{item[:name]} #{item[:price]}"
  end

  choice = gets.chomp.to_i

  if (choice >= options.size)
    puts "Not a valid menu item. Please choose again."
    get_user_dinner(options)
  end

  return options[choice]
end

class Cart
  attr_accessor :items, :main_dishes, :side_dishes
  def initialize(items = [])
    @items = items
  end

  def add_item(item)
    @items.push(item)
  end

  def print()
    @items.each do | item |
      puts item[:name]
    end
  end

  def total()
    sum = 0

    @items.each do | item |
      sum = sum + item[:price] 
    end
    
   
    return sum
  end
end

cart = Cart.new()
ordering = true

while ordering do
  item = get_user_dinner(main)
  #item = get_user_dinner(side1)
  #side2 = get_user_dinner(side2)
  cart.add_item(item)
  puts "Hit enter to order more!! type DONE to checkout"
  quit = gets.chomp

  if (quit == 'DONE')
    ordering = false
  end 
end

cart.print
total = cart.total()
puts "Your total is #{total}"

#puts choices


