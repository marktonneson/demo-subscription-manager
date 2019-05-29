#!/bin/bash
#
# Scenario: Using Activation Keys
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
   Scenario: Using Activation Keys


Activation keys are one of the more important features in the workflow of
provisioning and registering hosts. They setup many of the things needed to
properly build a host.

An activation key is a token issued by a subscription management service,
such as Satellite or the Red Hat Portal that allows you the ability to register
a host without a username/password.

In addition to no longer requiring a username/password, activation keys are
useful for automation as they can set many subscription and content related
items at registration.
"
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e $FormatTextSyntax "
Auto attach + activation keys

When configuring a key with the intent of getting a Red Hat subscription
attached, the presence (or absence) of Red Hat Subscriptions and the auto attach
property will change how an activation key behaves.

Use Case 1: Use EXACTLY the subscriptions specified
\t You can associate a subscription (or multiple subscriptions) to a key,
\t and force that (those) subscription(s) to be applied.

Use Case 2: Define NO subscriptions, and auto attach something proper
\t You can associate no subscription to a key, set the key to auto attach,
\t and the key will pick the best subscription. This is similar to running
\t subscription-manager register --auto-attach.  This use case works well
\t for VDC subscriptions.

Use Case 3: Use ANY of a subset of subscriptions
\t You can associate n subscriptions to a key, set the key to auto attach,
\t and then auto attach will apply only to the listed subscriptions.
"
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL
echo -e $FormatTextSyntax "
General Best Practices for Activation Keys

As a general practice, follow the UNIX model of 'doing one thing well' with
activation keys, as it allows their reuse. Additionally, which activation key
that was used to register a host is stored as part of the host's profile,
allowing you the ability to query this via the UI or API. Lastly, by having
activation keys that do one thing well and combining them, activation key sprawl
is prevented, or at least reduced.

Since subscriptions grant access to content, it is recommended to create keys
with the following workflow:
\t - Attach a valid subscription.
\t - Configure a host with the proper lifecycle environment and content View
\t - [Optional] attach subscriptions for custom (non Red Hat) content.
"
echo -e $FormatTextCommands "\t"
echo -e $FormatTextPause && read -p "<-- End of Demo: Press any key to exit -->" NULL
