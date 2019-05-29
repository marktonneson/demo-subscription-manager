#!/bin/bash
#
# Scenario: Working with virt-who
#

TextReset='\033[0m'
TextGreen='\033[32m'
TextBlue='\033[34m'
TextLightGrey='\033[37m'
TextBold='\033[1m'

FormatTextPause="$TextReset $TextLightGrey"  # Pause & continue
FormatTextCommands="$TextReset $TextGreen" # Commands to execute
FormatTextSyntax="$TextReset $TextBlue $TextBold" # Command Syntax & other text

# Place before command line to reset text format
FormatRunCommand="echo -e $TextReset"

# Reset text if script exits abnormally
trap 'echo -e $TextReset;exit' 1 2 3 15

clear
echo -e $FormatTextSyntax "
   Scenario: Working with virt-who

What it is: virt-who is an daemon which retrieves host-guest mapping information
from 1 or more hypervisor management platforms and reports that information to
the Subscription Management System (Satellite or the Portal)

To make the most efficient use of a Virtual Datacenter (VDC) subscription, you
want to run virt-who.
"
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e $FormatTextSyntax "
Virt-who and the temporary Subscription

Depending on your environment you may find that immediately after provisioning
a new virtual system, it does not have a valid subscription.  You will see output
like this:
"
echo -e $FormatTextCommands "
[root@rhel7]# subscription-manager status
+-------------------------------------------+
   System Status Details
+-------------------------------------------+
Overall Status: Insufficient

Red Hat Enterprise Linux for Virtual Datacenters, Standard (DERIVED SKU):
- Guest has not been reported on any host and is using a temporary unmapped guest subscription.
"
echo -e $FormatTextSyntax "
NOTE: This is normal and expected behavior.  The new system is granted a 24hr
temporary subscription, which allows virt-who to run and properly update the
subscription authority.  At the same time it does not prevent you from continuing
the provisioning of the new virtual system.
"
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e $FormatTextSyntax "
You can confirm that the correct subscription has been applied to your new virtual
system but examining the output of the following command.

Remember: Using activation keys can simplfy the registration and activation
process.  See activation key walkthru for more information.

Note: output truncated, highlighting relevant output only.
"
echo -e $FormatTextCommands "
[root@rhel7]# subscription-manager list --consumed
+-------------------------------------------+
   Consumed Subscriptions
+-------------------------------------------+
Subscription Name:   Red Hat Enterprise Linux for Virtual Datacenters, Premium
Provides:            Red Hat Enterprise Linux Server
...
SKU:                 MCT2862
...
Pool ID:             2c91830e5730bd8301573108000f00eb
...
Active:              True
Quantity Used:       1
Service Level:       Premium
...
Status Details:      Subscription is current
...
System Type:         Virtual
"
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

clear
echo -e $FormatTextSyntax "
Quick Tutorial: Troubleshooting virt-who

+ Global configuration file, /etc/sysconfig/virt-who, contains settings which
  apply to all virt-who connections from that host.
+ By default, virt-who logs all its activity to the file /var/log/rhsm/rhsm.log
"
echo -e $FormatTextCommands "\t # systemctl status virt-who"
echo -e $FormatTextCommands "\t # hammer virt-who-config list"
echo -e $FormatTextCommands "\t # virt-who --one-shot (-o) --print (-p) --debug (-d)
"
echo -e $FormatTextPause && read -p "<-- End of Demo: Press any key to continue -->" NULL
