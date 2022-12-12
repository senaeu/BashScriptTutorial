#! /bin/bash

#echo "hello bash linuxHint audience" > file.txt
echo "Topics covered in this tutorial"
echo "1-Hello Bash Scripting
      2-Redirect to file
      3-Comments
      4-Conditional Statements
      5-Loops
      6-Script input
      7-Script output
      8-how to send output from one script to another scrpt
      9-String Processing
      10-Numbers and Arithmetic
      11-Declare Command
      12-Arrays
      13-Functions
      14-Files and Directories
      15-Send Email Via Script
      16-Curl in Scripts
      17-Professional Menus
      18-Wait for filesystem events with inotify
      19-Introduction to grep
      20-Introduction to awk
      21-Introduction to sed
      22- Debugging bash scripts
"

#: '
#this is a cat command
#this is a cat command
#this is a cat command
#this is a cat command
#this is a cat command
#this is a cat command'
echo "redirect file"
#cat >> file.txt  # >>append text
#cat >file.txt    #> replace text
echo "4-Conditional Statements"

count=12
if [ $count -eq 10 ]

#NOT EQUALTO [ $count -ne 10 ]
#EQUALTO    [ $count -eq 10 ]
#GREATERTHAN [ $count -gt 10 ]
then
      echo "the condition is true"
else
      echo "the condition is false"
fi


#=================================
if (( $count > 9 ))
then
  echo "the condition is true"
elif(( $count <= 9 ))
then
  echo "the condition is true"
else
  echo "the condition is false"
fi

#===& operator===
echo "&& operand"
age=10

if [ "$age" -gt 18 ] && [ "$age" -lt 40 ]
then
   echo "Age is correct"
else
  echo " Age is not correct"
fi

# or conditional |
echo "|| opperand"
age=20

if [ "$age" -gt 18  -o  "$age" -lt 40 ]
then
   echo "Age is correct"
else
  echo " Age is not correct"
fi

echo "================="
age=60

if [ "$age" -lt 18  -o  "$age" -lt 40 ]
then
   echo "Age is correct"
else
  echo " Age is not correct"
fi

#if we use || symbol syntax will be

age=23

if [[ "$age" -lt 18  ||  "$age" -lt 40 ]]
then
   echo "Age is correct"
else
  echo " Age is not correct"
fi


echo "loops "
number=1
while [ $number -lt 10 ]
do
     echo "$number"
     number=$(( number+1 ))

done

# "less and equal"

number=1
while [ $number -le 10 ]
do
     echo "$number"
     number=$(( number+1 ))
done

#Until loops
echo "Until loop"

number=1
until [ $number -ge 10 ]
do
     echo "$number"
     number=$(( number+1 ))
done


#for loop
echo "for loop"

for i in {0..20}
do
    echo $i
done

#increment by 2

echo "for loop"

for i in {0..20..2} #{start..ending..increment}
do
    echo $i
done


echo "======================"
echo "for i loop"

for (( i=0;i<5;i++))
do
   echo $i
done


echo "==========inner if condition with break==========="
for (( i=0;i<10;i++))
do
  if [ $i -gt 5 ]
  then
     break
   fi
   echo $i
done

echo "==========inner if condition with continue==========="


for (( i=0;i<=10;i++))
do
  if [ $i -eq 3 ] || [ $i -eq 7 ]
  then
     continue
   fi
   echo $i
done

echo "6-Script input"
args=("$@")
#echo ${args[0]} ${args[1]} ${args[2]}
echo $@
echo "if you want to know how many indexes are there $#"
echo $#

#read file line by line
echo "#read file line by line"
#
#while read line
#do
#  echo "$line"
#done < "${1:-/dev/stdin}"


echo "======creating 2 files std error and otput========"
echo "   7-Script output"
ls -al 1>file1.txt 2>file2.txt

#if you want to write stdout and std error to same file
ls -al >& file3.txt

echo "send output from one script to another script"
message="Hello from linux"
export message
./secondScript.sh

echo "getting input from user"
echo "enter 1st string"
read st1
echo "enter 2nd string"
read st2

if [  "$st1" == "$st2" ]
then
    echo "string match"
else
    echo "string dont match"
fi

echo "lets check if one string is smaller than other"
echo "enter 1st string"
read st3
echo "enter 2nd string"
read st4

if [ "$st3"  \<  "$st4" ]
then
    echo "$st3 is smaller then $st4"
elif [ "$st3" \> "$st4" ]
then
    echo "$st4 is smaller than $st3"
else
    echo "Both strings are equal"
fi

#concatination
echo "concatination"
echo "enter 1st string"
read st1
echo "enter 2nd string"
read st2

c=$st1$st2
echo $c

echo "upper case ${st1^^} & lower case ${st2^}"

echo ${st1^^} "upper case"
echo ${st2^}  "lower case"

echo "to turn first latter capital $st1^l first letter of the word"

echo "Aritmetic operations"
n1=4
n2=20
echo $(( n1 + n2 ))
echo $(( n1 - n2 ))
echo $(( n1 * n2 ))
echo $(( n1 / n2 ))
echo $(( n1 % n2 ))

echo "another way of doing arithmetic operations"
echo $(expr $n1 + $n2 )
echo $(expr $n1 - $n2 )
echo $(expr $n1 \* $n2 )
echo $(expr $n1 / $n2 )
echo $(expr $n1 % $n2 )


echo "Enter Hex number of your choice"
read Hex

echo -n "The decimal value of $Hex is : "
echo "obase=10;ibase=16; $Hex"|bc

echo "Declare Command"
#open git bash and type declare MyVariable=30
#then type declare -p we can see the variable we created
#Read only variable
echo "read only variable using this command declare -r"
declare -r pwdfile=/etc/passwd
echo $pwdfile
pwdfile=/etc/abc.txt

echo "Arrays"
car=('BMW' 'Toyota' 'Honda')
echo "${car[@]}"
echo "${car[0]}"
echo "indexes of the array "
echo "${!car[@]}"
echo "lenght of the array"
echo "${#car[@]}"
echo "deleting a spesific element from an index "
unset car[2]
echo "adding a value to a specific index"
car[2]='Lexus'
echo "${car[@]}"

echo "FUNCTIONS"
function foo() {
  echo "this is a new functions"
  echo $1 $2 $3 $4
}
#calling the function here
foo hi This is Linux


echo "======================="
function functionCheck() {
returningValue="using Function right now"
echo "$returningValue"
}
functionCheck

echo "Files and Directories"
echo "create directory with -p when there is a file -p prevents throwing error"

#mkdir -p Drirectory2
#rmdir Drirectory2

echo "Enter directory name to check"
read direct
 echo "-d "$direct"] " will check if the directory is exist

 if [ -d "$direct" ]
 then
   echo "$direct exist"
 else
   echo "$direct doesnt exist"
 fi

 echo "Enter the file to create"
 read fileName
 touch $fileName

echo "Enter fileName name to check"
read fileName
 echo "-f "$fileName"] " will check if the fileName is exist

 if [[ -f "$fileName" ]]
 then
   echo "$fileName exist"
 else
   echo "$fileName doesnt exist"
 fi

echo "aapend text in the existing file"

echo "Enter filename which you want to append"
read fileName

if [[ -f "$fileName" ]]
then
  echo "Enter the text you want to append"
  read fileText
  echo "$fileText" >> $fileName
#  if we do echo "$fileText" > $fileName it will replace all content with new line
else
  echo "$fileName doesnt exist"
fi


echo "Read file line by line"
echo "Enter filename which you want to read"
read fileName

if [[ -f "$fileName" ]]
then
  while IFS= read -r line
  do
    echo "$line"
done < $fileName
else
  echo "$fileName doesnt exist"
fi

echo "Enter file you want to remove"
read fileName

if [[ -f "$fileName" ]]
then
  rm $fileName
  echo "file has been deleted successfully"
else
  echo "$fileName doesnt exist"
fi

#================================
echo "SENDING EMAIL VIA SCRIPT"
#sudo apt install ssmtp
#ssmtp testing@gmail.com

echo "Curl in Scripts"
url="https://proof.ovh.net/files/"
curl ${url} > outputfile
 #this will download file curl ${url} -o or if we want another location
 #curl ${url} -o NewFileDownload

echo "Getting information on Server,header-Type http status code "
url="https://proof.ovh.net/files/1Mio.dat"
curl -I ${url}

#echo "PROFESSIONAL MENUS"
#select car in BMW LEXUS TESLA TOYOTA
#do
#  echo "You have selected $car"
#done

echo "SWITCH STATEMENT"
#
#select car in BMW LEXUS TESLA TOYOTA
#do
#  case $car in
#  BMW)
#    echo "BMW SELECTED";;
#  LEXUS)
#    echo "LEXUS SELECTED";;
#  TESLA)
#    echo "TESLA SELECTED";;
#  TOYOTA)
#    echo "TOYOTA SELECTED";;
#  *)
#    echo "ERROR! Please select beetwen 1..4";;
#  esac
#done

#=====================================
echo "Press any key to continue"
#while [ true ]
#do
#    read -t 3 -n 1
#if [ $? = 0 ]
#then
#  echo "you have terminated the script"
#  exit;
#else
#  echo "waiting for you to press the key sir!!!"
#fi
#done

echo "WAIT FOR FILESYSTEM EVENTS WITH INOTIFY inotfiy is a sub linux system to watch directories"

#install inotify
#sudo apt install inotify-tools
 mkdir -p temp/NewFolder
inotifywait -m temp/NewFolder

echo "INTRODUCTION TO GREP"
echo "Enter filename to search text from"
read fileName

if [[ -f $fileName ]]
then
  echo "Enter the text to search"
  read grepvar
  grep -i -n -c -v $grepvar $fileName
  # -n line number, -v without the words
  # -c count -i ignore case
else
  echo "$fileName" does not exist
  fi

echo "INTRODUCTION TO AWK"

echo "Enter file to print from awk"
read fileName

if [[ -f "$fileName" ]]
then
  awk '/linux/{print}' $fileName #this will print all lines contain linux
  awk '/linux/{print $2}' $fileName #this will print second word from all lines
  awk '/linux/{print $2,$3,$5}' $fileName # we can search multiple
else
  echo "$fileName does not exist"
fi

echo"==================================="
echo "INTRODUCTION TO SED(STREAM EDITOR)"


echo "Enter filename to substitude using sed"
read fileName

if [[ -f $fileName ]]
then
  cat file.txt | sed 's/i/I/' # s=substitude in the file i with I it will replace i with I in the file
  cat file.txt | sed 's/i/I/g' #g stands for global it will do all file i to I
#   2nd way of writing above sntax
#sed 's/i/I' $fileName
else
  echo "$fileName" does not exist
  fi


echo "===================================="
echo "Enter filename to substitude using sed putting all changes to new file"
read fileName

if [[ -f $fileName ]]
then
#  cat file.txt | sed 's/i/I/' # s=substitude in the file i with I it will replace i with I in the file
#  cat file.txt | sed 's/i/I/g' #g stands for global it will do all file i to I
##   2nd way of writing above sntax
sed 's/i/I/g' $fileName >temp/NewFolder/sed.txt
else
  echo "$fileName" does not exist
  fi

  echo "IF YOU WANT TO ODIFY THE EXISTING FILE USE sed -i caution non reversible"

echo "Enter filename to substitude using sed"
read fileName

if [[ -f $fileName ]]
then
  sed -i 's/i/I' $fileName
else
  echo "$fileName" does not exist
  fi


echo "DEBUGGING BASH SCRIPT"
echo "open terminal and enter
bash -x ./Hello.sh
this will show errors step by step
or we can put  #! /bin/bash -x on top of the file where
our shebang command line is"
echo "3rd way is add set -x and set +x to script
to start point to end point

read fileName
 set -x
if [[ -f $fileName ]]
then
  sed -i 's/i/I' $fileName
  set +x
else
  echo "$fileName" does not exist
  fi


for more info https://www.youtube.com/watch?v=e7BufAVwDiM&ab_channel=linuxhint

  "



#NOT EQUALTO [ $count -ne 10 ]
#EQUALTO    [ $count -eq 10 ]
#GREATERTHAN [ $count -gt 10 ]















