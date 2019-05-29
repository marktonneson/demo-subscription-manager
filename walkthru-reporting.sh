#!/bin/bash
#
# Scenario: Understanding the renewal experience
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

clear
echo -e $FormatTextSyntax "
Scenario: Renewals and Reporting

A subscription allows a system to access content, specifically software (rpms)
and patches (errata).

After subscriptions are renewed (or new subscriptions become active) there are
a few things that usually must be done:

\t 1. Import a new subscription manifest.
\t 2. (re)attach subscriptions to each host, one by one via the UI.
\t 3. (re)attach subscriptions to each activation key via the UI or Hammer (Satellite's CLI)

If you have a few systems which require a new subscription, this workflow is palatable.
If you have a large number of systems, this was very painful.

And since subscriptions provide access to content, you generally want to get
subscriptions attached post-renewal as quickly as possible.
"
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e $FormatTextSyntax "
Included in Satellite (6.2.2 and greater) are a number of tools to make working with subscriptions
(and thus handling renewals) easier.

\t The ability to attach sub iteratively
\t The ability to bulk attach subs via the UI
\t The ability to attach subs via csv import

Let's look at all three options ...
"
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e $FormatTextSyntax "
Method One: hammer CLI

Prior to Satellite version 6.2.2, hammer (the Satellite CLI) did not have the ability to attach a
subscription to a host directly.

This shows an example of finding systems with missing and/or expired subscriptions
and then the command to attach a valid subscription to the system.
"
echo -e $FormatTextCommands '
\t # hammer host list --search "subscription_status = invalid"
\t # hammer host subscription attach --host devnode.example.com --quantity 2 --subscription-id 192
'
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e $FormatTextSyntax "
Method Two: Satellite UI

Using the Satellite UI to do a bulk update can be accomplished in a number of different
ways -- depending on your Satellite configuration and your particular environment.

In general the process is to select a group of hosts (e.g. via a Host Collection or
using search criteria to find hosts) and performing a bulk action on those hosts.

Option: view 'Bulk Subscription: UI' video for a demonstration.
"
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e $FormatTextSyntax "
Sidebar: Subscription Reporting Tools

One of the big changes with Satellite 6 and also Red Hat Subscription Management (RHSM)
is that the tools now maintain an accurate inventory of what systems are consuming which subscription.
This information is useful for audit/reporting and other usages.

One of the most common questions we get is 'How can I see which systems are using which subscription?'

Answer: hammer-cli-csv, can be used to export subscription consumption usage.
"
echo -e $FormatTextCommands "
\t # hammer csv content-hosts \\
\t  --export \\
\t  --file content-hosts-export.csv \\
\t  --itemized-subscriptions \\
\t  --verbose \\
\t  --organization Example.com
 "
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e $FormatTextSyntax "
Method Three: Import csv

Firstly, export the state of your systems and their attached subscriptions.
You MUST do this pre-renewal, to capture the subscription state prior to the
subscriptions expire-on date.
"
echo -e $FormatTextCommands "
\t # hammer csv content-hosts --export --file content-hosts-export.csv --itemized-subscriptions --organization example.com
"
echo -e $FormatTextSyntax "
Now, edit this CSV to reflect the new subscriptions (e.g. replace old subs with new ones,
change contract numbers, etc.)

Finally, re-import the association of subscriptions to hosts.
"
echo -e $FormatTextCommands "
\t # hammer csv content-hosts --file content-hosts-export.csv --itemized-subscriptions --organization example.com
"
echo -e $FormatTextSyntax "
Option: view 'Bulk Subscription: CLI' video for a demonstration.
"
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e $FormatTextSyntax "
Hammer as an ad-hoc reporting tool.

Hammer has a few functionalities that make it useful for ad-hoc reporting.
As an example, you may not need system level subscription report, but you may want to know:
\t How many of the subscriptions that I've purchased are in use (or free)?

You can do this with hammer, specifically hammer subscription list.
Hammer can output to a number of formats, including CSV, YAML and JSON.
"
echo -e $FormatTextCommands "\t # hammer --output json subscription list --organization Example.com
"
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e $FormatTextPause && read -p "<-- End of Demo: Press any key to exit -->" NULL
