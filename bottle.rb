require 'pry'
# Calculate how many bottles purchased
def bottles_purchased(money)
  money / 2
end

# Calculate number of free bottles from caps
def free_from_caps(caps)
  caps / 4
end

# Calculate number of free bottles from empties
def free_from_empties(empties)
  empties / 2
end

# Calculate number of bottles received after purchase and how many you get recycling them
def total_bottles(money)
  bottles = bottles_purchased(money)

  total_caps = bottles
  total_empties = bottles

  total_free_from_caps = 0
  total_free_from_emptes = 0

  # how many bottles purchased
  # how many bottles from empties
  # how many bottles from caps

  # how many empties and caps left over

  while total_caps > 3 || total_empties > 1
    new_bottles = free_from_caps(total_caps) + free_from_empties(total_empties)
    caps_used = free_from_caps(total_caps) * 4
    empties_used = free_from_empties(total_empties) * 2

    puts "Adding #{new_bottles} to #{bottles} bottles, which costs #{caps_used} of #{total_caps} caps and #{empties_used} of #{total_empties} empties"

    bottles += new_bottles
    total_caps += new_bottles - caps_used
    total_empties += new_bottles - empties_used 

    total_free_from_caps += free_from_caps(total_caps)
    total_free_from_emptes += free_from_empties(total_caps)

  end

  puts "\nYou purchased #{bottles_purchased(money)} bottles."
  puts "\nYou received #{total_free_from_caps} bottles from caps and #{total_free_from_emptes} bottles from empties."
  puts "\nYou received #{bottles} bottles in total!"
  puts "\nYou have #{total_caps} cap(s) left and #{total_empties} empties left.\n\n"
end

def ask_for_money
  puts "How much money would you like to spend?"
  answer = gets.chomp.to_i

  if answer > 0
    total_bottles(answer)
  else
    puts "That's not a number! Numbers only please. \n\n"
    ask_for_money
  end
end


ask_for_money