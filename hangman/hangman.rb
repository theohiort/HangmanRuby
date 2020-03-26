while true
hangman_status_array = [
"_________          
|         |         
|                   
|                   
|                   
|                   
|              ",   

"_________     
|         |    
|         0    
|              
|              
|              
|              ",

"_________     
|         |    
|         0    
|         |    
|              
|              
|              ",

"_________     
|         |    
|         0    
|        /|    
|              
|              
|              ",

"_________     
|         |    
|         0    
|        /|\\  
|              
|              
|              ",

"_________     
|         |    
|         0    
|        /|\\  
|        /     
|              
|              ",

"_________     
|         |    
|         0    
|        /|\\  
|        / \\  
|              
|              "
]


require_relative "things/functions_and_things.rb"

hangmanindex = 0 
secret_word = File.readlines("things/words.txt")[rand(0...File.readlines("things/words.txt").length)].chomp
secret_word_array = secret_word.split("")
wrongletters = []
array_of_displayed_letters = []

for x in secret_word_array
    array_of_displayed_letters << "?"
end

currenthangmanstatus = hangman_status_array[hangmanindex]


while currenthangmanstatus != hangman_status_array[5] && array_of_displayed_letters != secret_word_array

puts "enter a letter that you would like to guess! enter \"quit\" to quit."

currenthangmanstatus = hangman_status_array[hangmanindex]
puts currenthangmanstatus

print "Det hemliga ordet: "
for x in array_of_displayed_letters
    print x
end

puts "\n==========================="

print "Felgissade bokstäver: "
for x in wrongletters
    print x.upcase
    print ", "
end
puts

input = gets.chomp
if input == "quit"
    break
end

index_result = indexes_of_char(input, secret_word_array)
if index_result == false 
    wrongletters << input
    hangmanindex += 1
else
    for x in index_result
        array_of_displayed_letters[x] = secret_word_array[x]
    end
end
system("cls")
end

if input != "quit"  
    puts currenthangmanstatus
    print "Det hemliga ordet: "
    for x in array_of_displayed_letters
        print x
    end
    puts "\n==========================="
    print "Felgissade bokstäver: "
    for x in wrongletters
        print x.upcase
        print ", "
    end
    puts 
    puts
    if array_of_displayed_letters == secret_word_array
        puts "congratulations! You guessed the word before the man was hanged!"
    else
        puts "Oh no! The man was hanged before you were able to guess the secret word! The secret word was #{secret_word}."
    end
end

puts "play again? y/n"
playagain= gets.chomp 
if playagain != "y" 
    break
end
system("cls")
end