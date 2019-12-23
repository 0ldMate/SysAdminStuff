# Microsoft Dynamics CRM Add-in Issue

If you've used the Microsoft Dynamics CRM Add-in at all you may have come across it automatically disabling itself consistently. This issue occurs across our sales staff all the time especially those in Queensland.

## What's causing it?

This issue is mainly caused by slow network connection at the time of Outlook being opened. When Outlook opens it looks for any add-ins that are slowing it down and requests to disable it. Now, it doesn't disable it without letting the user know, however most people (myself included) will just instantly click the close box without reading it and then realise later that the add-in isn't enabled. 

## The Fix!

Luckily, when Outlook disables any add-ins it creates an event log with the id of 59. This means you're able to create a scheduled task that triggers every time an  event with that id appears in the logs.

## The Script!

"What does the script do?" You might ask. It uses the Windows Registry to check for any disabled add-ins and removes them from the disabled field. It then alters the load value for the add-in to 3 (Loaded and Load on startup) so it always loads the add-in.
Learn about different add-in loadbehaviors here https://docs.microsoft.com/en-us/visualstudio/vsto/registry-entries-for-vsto-add-ins?view=vs-2019
