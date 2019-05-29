#!/bin/bash
#
# Scenario: Working with Dot Releases and EUS
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
FormatRunCommand="echo -e \t $TextReset"

# Reset text if script exits abnormally
trap 'echo -e \033[0m && exit' 1 2 3 15

# Prompt to run commands or just view
echo -e "Setup: By default this script only shows commands that could be run.
 To run the commands locally, enter 'yes' below."
read -p "Run commands locally? [NO/yes]" RunCmds
test -z $RunCmds && RunCmds=NO

clear
echo -e $FormatTextSyntax "
   Scenario: Working with Dot Releases and EUS

"
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e $FormatTextSyntax "
- Create a Satellite content view which includes all of the EUS dot versions
  that you want to work with (7.4, 7.5, etc.).
- If you're provisioning from Satellite be sure to include the appropriate
  kickstarts and satellite tools repos.
- Do not include the 7Server (latest version) repo.
- Provision your system and attach it to satellite
"
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e $FormatTextSyntax "
- Run the following command:
"
$FormatRunCommand "# subscription-manager release --list"
if [ $RunCmds = "yes" ] ; then
   subscription-manager release --list
fi

echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e $FormatTextSyntax "
- Note that if you run a 'yum update' it may fail because the command is looking
  for the 7Server repo by default.
- Run the following command to attach the client to a specific EUS dot version:
"
$FormatRunCommand "# subscription-manager release --set '7.4'"
if [ $RunCmds = "yes" ] ; then
  subscription-manager release --set '7.4'
fi

echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e $FormatTextSyntax "
- Now run a 'yum update', and the latest errata from the 7.4 EUS repo
  will be applied.
- After the yum update completes, run the following commands:
"
$FormatRunCommand "# subscription-manager release"
$FormatRunCommand "# cat /etc/redhat-release
"
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e $FormatTextSyntax "
- At this point, the client will stay at version 7.4, and will receive updates
  from the 7.4 EUS channel as they are released and synced.

- If you want to upgrade to EUS v7.5, do the following:
"
$FormatRunCommand "# subscription-manager release --set '7.5'"
$FormatRunCommand "# subscription-manager release
"

echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e $FormatTextSyntax "
- IMPORTANT: After changing the release value, clean yum repos
"
$FormatRunCommand "# yum clean all"

echo -e $FormatTextSyntax "
- Now run a yum update, and when it's complete, you should be at v7.5:
"
$FormatRunCommand "# yum update"
$FormatRunCommand "# subscription-manager release"
$FormatRunCommand "# cat /etc/redhat-release
"

echo -e $FormatTextPause && read -p "<-- End of Demo: Press any key to continue -->" NULL
