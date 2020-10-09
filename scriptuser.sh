#!/bin/bash

echo "Enter username and password"
echo "Username:"
read username
user=$(id | cut -d "(" -f2 | cut -d ")" -f1)

hash=$(sudo cat /etc/shadow | grep "$user" | cut -d "$" -f 3)
inputpassword=$(sudo openssl passwd -6 -salt "$hash" | cut -d "$" -f 4)
password=$(sudo cat /etc/shadow | grep "$user" | cut -d "$" -f 4| cut -d ":" -f 1)
if [ "$username" == "$user" ] && [ "$inputpassword" == "$password" ];
then
	echo "Access Granted!"
while true; do
	echo "Choose any options from below:"
	echo "1. Factorial"
	echo "2. Sum of array"
	echo "3. To print a pattern"
	echo "4. Compute Compound Interest"
	

	read choice
	case $choice in
	1)
	echo "Enter Number To Find It's Factorial:"
read num
 
factorial=1
 
for ((i=1;i<=num;i++))
do
    factorial=$(($factorial*$i))
done
 
echo Factorial of $num is $factorial 
exit	;;

	2)
echo "Enter size of array:"
read N
echo "Enter array elements:"
read -a A
for elem in "${A[@]::N}"; do
    ((ar_sum+=$elem))
done
echo	"Sum of elements:"
echo $ar_sum
exit	;;

	3)
echo "enter value of  n "
read num
for (( i=1;i<=$num ;i++))
do
   for (( j=$num;j>=i;j-- ))
   do
   echo -n " "
   done
   for (( c=1;c<=i;c++ ))
   do
   echo -n " *"
   sum=`expr $sum + 1`
   done
echo ""
done
d_max=`expr $num - 1`
for (( i=$d_max;i>=1;i--))
do
   for (( j=i;j<=$d_max;j++ ))
   do
   if [ $j -eq $d_max ]
   then
   echo -n " "
   fi
   echo -n " "
   done
   for (( c=1;c<=i;c++ ))
   do
   echo -n " *"
   sum=`expr $sum + 1`
   done
echo ""
done
exit	;;
	4)
 echo "Enter the values: Principal Amount,Time (In Years),Rate of Interest and
number of times interest applied per year"
read p
read t
read r
read n
power=`expr $n \* $t`
echo $power
ci=`echo "scale=2; $p * ( 1 + $r / $n ) ^ $power" | bc`
echo "Compound Interest = $ci" 
exit	;;
5)exit 
	;;
*) echo "Invalid Choice"
	;;
esac
done
else
	 echo "Access Denied!"
fi
