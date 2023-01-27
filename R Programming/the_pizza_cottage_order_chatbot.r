print("Welcome to The Pizza Cottage!")
print("Please enter your name:")
cust_name <- readLines("stdin",n=1)
print(paste("Hello ! ",cust_name))

## loop 1 Toppings
loop_1 <- 0
while (loop_1 < 1){

  print("Which topping do you need today? (type number only)")
  print("1.Hawaiian 2.Cheese 3.Seafood")
  topping <- readLines("stdin", n=1)
    if(topping == 1) {
      pizza_topping <-"Hawaiian"
      print(paste("Pizza topping is",pizza_topping))
      break
    } else if (topping == 2) {
      pizza_topping <- "Cheese"
      print(paste("Pizza topping is",pizza_topping))
      break
    } else if (topping == 3) {
      pizza_topping <- "Seafood"
      print(paste("Pizza topping is",pizza_topping))
      break
    } else {
      print("Not valid, please enter again")
    }
  }
## loop 2 Sauce
loop_2 <- 0
while (loop_2 < 1){

  print("Which sauce would you like? (type number only)")
  print("1.Pizza Sauce 2.Thousand Island Sauce 3.Cottage Signature Sauce")
  sauce <- readLines("stdin", n=1)
    if(sauce == 1) {
      pizza_sauce <-"Pizza Sauce"
      print(paste("Pizza sauce is",pizza_sauce))
      break
    } else if (sauce == 2) {
      pizza_sauce <- "Thousand Island Sauce"
      print(paste("Pizza topping is",pizza_sauce))
      break
    } else if (sauce == 3) {
      pizza_sauce <- "Cottage Signature Sauce"
      print(paste("Pizza sauce is",pizza_sauce))
      break
    } else {
      print("Not valid, please enter again.")
    }
  }
## loop 3 Side Dish
loop_3 <- 0
while (loop_3 < 1){

  print("Which side dish would you like? (type number only)")
  print("1.Fries 2.Onion rings 3.Chicken Wings.")
  side <- readLines("stdin", n=1)
    if(side == 1) {
      pizza_side <-"Fries"
      print(paste("Side dish is",pizza_side))
      break
    } else if (side == 2) {
      pizza_side <- "Onion rings"
      print(paste("Side dish is",pizza_side))
      break
    } else if (side == 3) {
      pizza_side <- "Chicken Wings"
      print(paste("Side dish is",pizza_side))
      break
    } else {
      print("Not valid, please enter again.")
    }
  }
## loop 4 Drinks
loop_4 <- 0
while (loop_4 < 1){

  print("Which drink would you like? (type number only)")
  print("1.Cola 2.Lemonade 3.Beer")
  drink <- readLines("stdin", n=1)
    if(drink == 1) {
      pizza_drink <-"Cola"
      print(paste("Drink is",pizza_drink))
      break
    } else if (drink == 2) {
      pizza_drink <- "Lemonade"
      print(paste("Drink is",pizza_drink))
      break
    } else if (drink == 3) {
      pizza_drink <- "Beer"
      print(paste("Drink is",pizza_drink))
      break
    } else {
      print("Not valid, please enter again.")
    }
  }
## Address

print("Please enter your address for delivery.")
address <- readLines("stdin", n=1)



print("Order Summary:")
print(paste("Pizza Topping :",pizza_topping))
print(paste("Pizza Sauce :",pizza_sauce))
print(paste("Side Dish :",pizza_side))
print(paste("Pizza Sauce :",pizza_drink))
print("Pizza Price : $15")
print(paste("Delivery Address :",address))


## loop 5 confirm order
loop_5 <- 0
while (loop_5 < 1){

  print("Would you like confirm order?  (Yes or No)")
  confirm <- readLines("stdin", n=1)
    if(toupper(confirm) == "YES"){
      print("Thank you for purchasing !. Please be ready for your payment.")
      break
    } else if (toupper(confirm) == "NO") {
      print("We are sorry to hear that. We are looking forward to prepare pizza for you. Please come again")
      break
    } else {
      print("Not valid, please enter again")
    }
  }
