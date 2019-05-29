#!/bin/bash
#
# Run this to loop thru any or all walkthrus
#

TextReset='\033[0m'

TextRed='\033[31m'
TextGreen='\033[32m'
TextBlue='\033[34m'

# Reset text if script exits abnormally
trap 'echo -e \033[0m && exit' 1 2 3 15

while : # Loop forever
do
  clear
  echo -e $TextBlue "
  \t =============
  \t    M E N U
  \t =============
  \t 1. Subscription-manager Basics
  \t 2. Working with virt-who
  \t 3. Using Activation Keys
  \t 4. Renewals
  \t 5. Subscription Reporting Tools

  \t (Q)uit
"
read -p " Enter your choice: " choice
  case $choice in
    1) source walkthru-basics.sh ;;
    2) source walkthru-virt-who.sh ;;
    3) source walkthru-activationkeys.sh ;;
    4) source walkthru-renewal.sh ;;
    5) source walkthru-reporting.sh ;;
    q|Q) echo -e $TextReset && exit ;;
    *) echo -e $TextRed "ERROR: Choice '$choice' is not valid " $TextReset; sleep 2 ;;
  esac
done
