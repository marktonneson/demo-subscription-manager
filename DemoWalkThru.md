## Subscription Manager Demo WalkThru

### Requirements
* For most demo scenarios, any system registered or capable of being registered to Red Hat via RHSM
* For other demo scenarios, utilizing Satellite, will require a valid Satellite subscription, setup, and connectivity.
* Each scenario will list required components

### WalkThru:
#### Scenario: Subscription-manager Basics
* Requirements:
  * System registered to Portal or Satellite
  * For best results, do not use with employee subscription (not representative).  
* Run the following for an interactive walk thru: ```walkthru-basics.sh```
  * Note: you may have to edit walk thru accordingly to match subscription used
* References:
  * Blog posts 1 & 2 (see README)
  * [Subscription-Manager Command Cheat Sheet](https://access.redhat.com/articles/rhsm-cheat-sheet)

#### Scenario: Working with virt-who
* Requirements:
  * Optional: system with virt-who installed to demo troubleshooting steps
* Run the following for an interactive walk thru: ```walkthru-virt-who.sh```
* References:
  * Blog posts 3 & 5 (see README)
  * [Red Hat Labs: virt-who configuration helper](https://access.redhat.com/labs/virtwhoconfig)

#### Scenario: Using activation keys
* Requirements:
  * Optional: Satellite environment to view existing activation keys
* Run the following for an interactive walk thru: ```walkthru-activationkeys.sh```
* References:
  * Blog post 9 (see README)

#### Scenario: Renewals and Reporting
* Requirements:
  * Optional: Satellite environment to run hammer commands against
* Run the following for an interactive walk thru: ```walkthru-reporting.sh```
* References:
  * Blog posts 6 & 12 (see README)
  * [Bulk Subscription: UI video](https://www.youtube.com/watch?v=lwqtLqXgxmk&feature=youtu.be)
  * [Bulk Subscription: CLI video](https://www.youtube.com/watch?v=s0S_jbLqOgI&feature=youtu.be)

#### Scenario: Working with Dot Releases & EUS
* Note: Content here courtesy of Lee Whitty
* Requirements:
  * Satellite with EUS subscription available
  * Content Views with EUS enabled
* Run the following for an interactive walk thru: ```walthru-eus.sh```
* Additional Info: [Understanding Red Hat Content Delivery Network Repositories and their usage with Satellite 6](https://access.redhat.com/articles/1586183)
