## This is basic R programming projects
print("WELCOME TO PAO-YING-CHUP GAME")
print("Please enter your name")
name <- readLines("stdin",n=1)
print(paste("Hello ",name))
n <- 0
w <- 0
d <- 0
l <- 0
sh <-c("Rock","Paper","Scissors")
while(n<1) {
  print("Choose your shoot!!")
  print("1.Rock 2.Paper 3.Scissors 4.Score 5.Quit Game")
  shoot <- readLines("stdin",n=1)
  enemy <- floor(runif(1,min=1,max=4))
  print(shoot)
  ## Win / Draw / Lose condition
  if ((shoot == 1 && enemy ==3)||(shoot == 2 && enemy ==1)||(shoot == 3 && enemy ==2)){
    print (paste(name,"choose:",sh[as.numeric(shoot)]))
    print (paste("Enemy choose:",sh[enemy]))
    print ("You win!!")
    w <- w+1
  } else if ((shoot == 1 && enemy ==1)||(shoot == 2 && enemy ==2)||(shoot == 3 && enemy ==3)){
    print (paste(name,"choose:",sh[as.numeric(shoot)]))
    print (paste("Enemy choose:",sh[enemy]))
    print ("Draw!!")
    d <- d+1
  } else if ((shoot == 1 && enemy ==2)||(shoot == 2 && enemy ==3)||(shoot == 3 && enemy ==1)){
    print (paste(name,"choose:",sh[as.numeric(shoot)]))
    print (paste("Enemy choose:",sh[enemy]))
    print ("You lose!!")
    l <- l+1
  } else if (shoot == 4){
    print (paste(name,"score:"))
    print (paste("Win  : ",w))
    print (paste("Draw : ",d))
    print (paste("Lose : ",l))
  } else if (shoot == 5){
    print (paste("Thank you for playing,",name,". Here's your score:"))
    print (paste("Win  : ",w))
    print (paste("Draw : ",d))
    print (paste("Lose : ",l))
    print ("See you later.")
    break
  } else {
    print ("Invalid order, try again.")
  }
}
