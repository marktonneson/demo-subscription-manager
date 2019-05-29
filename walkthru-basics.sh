#!/bin/bash
#
# Scenario: Subscription-manager Basics
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
   Scenario: Subscription-manager Basics

"
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e $FormatTextSyntax "
=== REGISTERING ===
Register the system which makes it known to the Customer Portal or Satellite
"
echo -e $FormatTextCommands "\t # subscription-manager register"

echo -e $FormatTextSyntax "
Next step is to attach a subscription, two methods shown below.
"
echo -e $FormatTextCommands "\t # subscription-manager attach --auto
\t # subscription-manager attach --pool <UUID>
"
echo -e $FormatTextSyntax "
Note: the register & attach commands can be combined into a single command:
"
echo -e $FormatTextCommands "\t # subscription-manager register --auto-attach
"
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e $FormatTextSyntax "
=== SUBSCRIPTIONS ===
List Products & Subscriptions

Products are the various basic components such as Red Hat Enterprise Linux,
Red Hat Software Collections, etc that are part of the Subscription that is purchased.

What is purchased are Subscriptions which are bundles of various Products.

Let's take a look at the output of these two commands:
"
echo -e $FormatTextCommands "\t # subscription-manager list
\t # subscription-manager list --consumed
"
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL
$FormatRunCommand
subscription-manager list
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL
$FormatRunCommand
subscription-manager list --consumed
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e $FormatTextSyntax "
List Subscriptions - Advanced: Finding a Subscription

An account with a large (or even medium) number of subscriptions can be frustrating
to deal with given the output of subscription-manager list --all --available.

Even use of a pager and/or grep can be painful.

Enter the use of the '--matches' parameter!

Let's take a look at the output of these three commands:
"
echo -e $FormatTextCommands "\t # subscription-manager list --available --matches 'Red Hat Satellite*'
\t # subscription-manager list --available --matches 'RH00004'
\t # subscription-manager list --available --matches 'Red Hat Satellite Capsule Server' --pool-only"

echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL
$FormatRunCommand
subscription-manager list --available --matches 'Red Hat Satellite*'
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL
$FormatRunCommand
subscription-manager list --available --matches 'RH00004'
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL
$FormatRunCommand
subscription-manager list --available --matches 'Red Hat Satellite Capsule Server' --pool-only
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e $FormatTextSyntax "
Custom Products in Satellite

The '--matches' parameter also works with custom products created within Satellite.

"
echo -e $FormatTextCommands "\t # subscription-manager list --available --matches 'Extra*'
"
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e $FormatTextSyntax "
Remember: Using activation keys can simplfy the registration and activation
process.  See activation key walkthru for more information.
"
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

clear
echo -e $FormatTextSyntax "
=== REPOSITORIES ===
Working with Repositories

The repositories that are enabled for a particular system determine what software
can be installed, as well as the errata (patches) to be applied.

Let's take a look at the output of these two commands:
"
echo -e $FormatTextCommands "\t # subscription-manager repos --list
\t # subscription-manager repos --list-enabled
"
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL
$FormatRunCommand
subscription-manager repos --list
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL
$FormatRunCommand
subscription-manager repos --list-enabled

echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e $FormatTextSyntax "
To \"reset\" the repositories available to a system, you may:

Disable every repo
"
echo -e $FormatTextCommands "\t # subscription-manager repos --disable '*'"

echo -e $FormatTextSyntax "
Enable only the ones you want:
"
echo -e $FormatTextCommands "\t # subscription-manager repos --enable rhel-6-server-rpms --enable rhel-6-server-optional-rpms
"
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

clear
echo -e $FormatTextSyntax "
=== TROUBLESHOOTING ===
During the lifecycle of a system it may be necessary to troubleshoot an issue
with subscription-manager and it's interaction with the upstream subscription
authority -- either the Red Hat Portal or Satellite.

Normally refreshing the client data is sufficient.
"
echo -e $FormatTextCommands "\t # subscription-manager refresh"
$FormatRunCommand
subscription-manager refresh
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e $FormatTextSyntax "
If the refresh option does not solve your issue you may be tempted to utilize
the 'clean' option.
"
echo -e $FormatTextSyntax "
Nuclear option -- clean
"
echo -e $FormatTextCommands "\t # subscription-manager clean"

echo -e $FormatTextSyntax "
Proceed with EXTREME CAUTION when using this option as it will wipe the
local system's identity WITHOUT informing the system it is registered to.
"
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e $FormatTextSyntax "
HOWTO: Recover from accidental 'clean' or 'unregister'
"
echo -e $FormatTextCommands "\t # grep 'Consumer Identity' /var/log/rhsm/rhsm.log
\t # subscription-manager register --consumerid=[from above command]
"
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

clear
echo -e $FormatTextSyntax "
=== OTHER ===
View facts that subscription-manager collects about the system.  This information
is used to apply the correct subscription.  For example, if the system is virtual
or how many sockets it has in the case of a physical machine.

Let's take a look at the output of this command:
"
echo -e $FormatTextCommands "\t # subscription-manager facts"
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL
$FormatRunCommand
subscription-manager facts
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e $FormatTextSyntax "
Find UUID

When a system is registered, either via the Portal or Satellite, it is assigned
a unique UUID.  Should you need to find its value, issue this command:
"
echo -e $FormatTextCommands "\t # subscription-manager identity"
$FormatRunCommand
subscription-manager identity

echo -e $FormatTextPause && read -p "<-- End of Demo: Press any key to continue -->" NULL
