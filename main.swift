import Foundation

// Ques - 1: write enum representing game status constants (no raw type) (won, lost, continue)

enum Status: String{  
case Won = "won"  
case Lost = "Lost" 
case Continue = "Continue" 
public static  let values = [Won, Lost, Continue]
}

// Ques -1 part second: write enum with Int constants representing common dice totals  (2,3,5,7,11,12)

enum condition: Int{
case two = 2 
case three = 3    
case five = 5       
 case  seven = 7            
case eleven = 11       
case twelve = 12       
   }  

// Ques 2: function that rolls two dice and returns them and their sum as a tuple

func rollTheDice() -> (Int, Int, Int) {          
  let first_num = Int.random(in: 1 ... 6)         
   let second_num = Int.random(in: 1 ... 6)
let sum: Int = first_num + second_num
let tuplesum = (first_num, second_num, sum)
return tuplesum
}

// Ques 3: function to display a roll of the dice

 func displayroll(_ get_value: (Int, Int, Int))-> String{

return "You rolled dice 1: \(get_value.0)  dice 2: \(get_value.1) \n Sum of Dices: \(get_value.2)"
}



var display = rollTheDice()
print(displayroll(display))
print ("------------------------")
var sum_dice = display.2 

// get value from tuple
var gameStatus = Status.Continue
 var mypoint: Int = 0

//let choice : condition = sum_dice

switch(sum_dice) {
case condition.seven.rawValue : 

gameStatus = Status.Won
break
case condition.eleven.rawValue: 
gameStatus = Status.Won
break
case condition.two.rawValue: 
gameStatus = Status.Lost
break
case condition.three.rawValue: 
gameStatus = Status.Lost
break
case condition.five.rawValue: 
gameStatus = Status.Lost
break
default: gameStatus = Status.Continue
mypoint = sum_dice
print ("Game is not Over Yet")
print ("Point: \(mypoint)")
print ("--------------------------")
break}

while (gameStatus == Status.Continue){  
display = rollTheDice() 
 sum_dice = display.2 
 print ("Again Turn : \n \(displayroll(display))")  
print ("-----------------------------------------") 
 if(mypoint == sum_dice){   
 gameStatus = Status.Won  
}else{
gameStatus = Status.Lost
print("You lost by: \(sum_dice)") 
 }
}
if(gameStatus == Status.Won){  
print("You Win !!!!")
}else { 
 print("You Lost !!!")
}
