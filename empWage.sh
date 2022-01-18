#!/bin/bash -x

isFullTime=1;
isPartTime=2;
totalSalary=0;
empRatePerHrs=20;
maxWorkingHrs=100;
maxWorkingDays=20;
totalEmpHrs=0;
totalWorkingDays=0;
function  getWorkingHrs () {
	case $1 in
      $isFullTime)
         empHrs=8
         ;;
      $isPartTime)
         empHrs=4
         ;;
      *)
         empHrs=0
         ;;
   esac
	echo $empHrs
}

function getEmpWageForADay(){
	echo $(($1*$empRatePerHrs))
}

while [[ $totalEmpHrs -lt $maxWorkingHrs && $totalWorkingDays -lt $maxWorkingDays ]]
do
	((totalWorkingDays++))
	empCheck=$((RANDOM%3));
	empHrs=$( getWorkingHrs $empCheck )
	totalEmpHrs=$(($totalEmpHrs+$empHrs));
	dailyWage[$totalWorkingDays]=$( getEmpWageForADay $empHrs )

done
totalSalary=$(($totalEmpHrs*$empRatePerHrs));
echo $totalSalary
echo ${dailyWage[@]}
