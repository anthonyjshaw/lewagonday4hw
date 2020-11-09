# List of shop items
shop_items = {
    'carrots' => {price: 100, quantity: 200}, 
    'apples' => {price: 175, quantity: 500},
    'coffee' => {price: 400, quantity: 20},
    'milk' => {price: 200, quantity: 50},
    'beer' => {price: 250, quantity: 150},
    'bread' => {price: 150, quantity: 400},
    'cookies' => {price: 90, quantity: 900},
    'crackers' => {price: 100, quantity: 500}
}

# Init basket hash
basket = {} 

# Method to display the items
def display_items(item)
  puts "******************DISPLAY ITEMS****************"
  item.each do |x, y| 
    if y[:quantity] != 0
    puts "We have #{x}: ¥#{y[:price]}.\n"
    puts " "
    else
      puts "Sorry, we're out of #{x}!"
      puts " "
    end
  end
  puts "*****************************************"
end

# Method to add to the basket
def add_to_basket(shop, cart)
    puts "************ADD TO BASKET**************"
    puts " "
    puts "What would you like to add? \n"
    print '> '
    response = gets.chomp
    if shop.key?(response)
        puts "How many?"
        print '> '
        quant_response = gets.chomp.to_i
        if quant_response > shop[response][:quantity]
          puts "Sorry that's too much!"
        elsif quant_response < 1
          puts "Sorry that's not enough. Please enter a higher number!"
        elsif cart[response] == nil   
          cart[response] = {price: shop[response][:price], quantity: quant_response}
          shop[response][:quantity] -= quant_response
          puts "Added #{response} x #{quant_response}!"
        end             
    else 
      puts "Sorry, not an item!" 
    end
    puts "******************************"
end

# Method to display the basket
def display_basket(cart)
    puts "*****************BASKET******************"
    puts " "
    cart.each {|x, y| puts "You have #{x} x #{y[:quantity]} = ¥#{y[:price] * y[:quantity]}"}
    puts ' '
    puts "*****************************************"
    puts " "
end

# Method to checkout
def check_out(cart)
    sum = 0
    cart.each do |x, y|
        puts "#{x}: ¥#{y[:price] * y[:quantity]}"
        sum += (y[:price] * y[:quantity])
    end
    puts "Your total is ¥#{sum}. Would you like to checkout? Please type 'yes' or 'no'"
    checkout = gets.chomp
    if checkout == 'yes'
    cart.clear
    puts "Thank you for shopping today!\n"
    elsif checkout == 'no'
    puts "No problem. Shop away!"
    end
end    

# Method to display quantity of items
def remaining_items(item)
    item.each do |x, y|
        if y[:quantity] == 0
            puts "OUT OF STOCK: We have no #{x} remaining!\n"
            puts " "
        else
            puts "There are #{y[:quantity]} x #{x} remaining." 
            puts " "
        end
    end
end

# Shopping loop
user_input = 0
puts "*****************HELLO! WELCOME TO GOOD FOODS! HOME OF THE GOOD FOODS! MAY I TAKE YOUR ORDER?*******************************"
puts "\n"
until user_input == '6'
    puts "What would you like to do?\n"
    puts "\n"
    puts "1. DISPLAY ITEMS    2. ADD TO BASKET          3. DISPLAY BASKET"
    puts " "
    puts "4. CHECKOUT         5. REMAINING ITEMS        6. QUIT" 
    puts "\n"
    print '> '
    user_input = gets.chomp.downcase
    # Choice conditional
    case user_input
    when "1"  then display_items(shop_items)
    when "2" then add_to_basket(shop_items, basket)
    when "3"  
        display_basket(basket)
        if basket == {}
            puts " " 
            puts "Empty basket!\n"
        end
    when "4" 
      if basket != {}
        check_out(basket)
      else
        puts "Sorry, you can't checkout: the basket is empty! You need to add an item to your basket!\n"
        puts ' '
      end  
    when "5" then remaining_items(shop_items)
    when "6" then puts "\n************************** OKAY! THANK YOU FOR SHOPPING TODAY AT GOOD FOODS! ********************************\n"
    else 
        puts "Not a request!"
    end       
end