#!/bin/bash
# A challenge for Chapter 2 of Up and Running with Bash Scripts
#
# Use some variables, some command substitution, and some string formatting
#+to make a small summary of some system information. Print the result to
#+the screen and write some information to a file.



freespace=$(df -h /| grep -E "\/$" | awk '{print $4}')
greentext="\033[32m"
bold="\033[1m"
normal="\033[0m"
logdate=$(date +"%Y%m%d")
logfile="$logdate"_report.log

echo -e $bold"Quick System report for "$greentext"$HOSTNAME"$normal
printf "\tSystem type: \t%s\n" $MACHTYPE
printf "\tBash Version: \t%s\n" $BASH_VERSION
printf "\tFree Space: \t%s\n" $freespace
printf "\tFiles in dir: \t%s\n" $(ls | wc -l)
printf "\tGenerated on: \t%s\n" $(date +"%m/%d/%y")

echo -e $greentext "A summary of this info has been saved to $logfile"$normal

cat <<- EOF > $logfile
	This report was automatically created by my Bash Script.
		It contains some system info.
