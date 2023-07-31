#Task1 is for comments, we can comment using '#' in script.Anything after hash will be consider as comment

#Task2 is for using echo command, let see how to use it
echo "Hi this is task2"  # this will display Hi this is task2 on terminal

#Task3 Variables in bash are used to store data and can be referenced by their name. Your task is to create a bash script that declares variables and assigns values to them

name="vinayak" #Declaring name varibale & assigning vlaue is vinayak
echo "my name is ${name}"  # we have used variable declared above in echo command
#lets assign one more variable & use above echo command
age=27 # here since we are assigning int value not need of "
echo "my name is ${name} & my age is ${age}"

#Task4 Create a script that takes two variables (numbers) as input and prints their sum using those variables.

read  -p "enter num1 " num1  && read -p "enter num2 " num2 # read is used to take user input when script is executed , -p allows to print message to be displayed to user
sum=$(( num1 + num2 )) #adding 2 numbers since we are doing arithmetic operation these numbers should be treated as variable thats why we did $ to whole result
echo " Addition of 2 numbers = ${sum}" #Displaying addition of 2 numbers


#Task5 Use built in variable example:  pwd,user,$?
# Use of pwd - it shows your current working directory
echo $PWD
# use of user - it shows which is current user logged in 
echo "current user is $USER"
# use of $? ,Represents the exit status of the last executed command (0 indicates success, non-zero values indicate failure).
echo $?  

#Task6 Wildcards are special characters used to perform pattern matching when working with files. Your task is to create a bash script that utilizes wildcards to list all the files with a specific extension in a directory.

# I have created 3 files , 2 with .txt & 1 with .xml extension 
# I will use ls -la *.txt ,this will list only files ending with .txt extension
ls -la *.txt
