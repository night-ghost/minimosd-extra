This alternate version is compatable with the Config Tool for v1.3 & 2.0.

It has all the setup menu items and panels from version 1.29.


Changes are:

Battery percent now displays milliAmps used. (Beta)

Using a Tx channel to toggle the OSD works like this:
 - When the channel is over 1700ms the panel is changed to the next one and a one second timer is started to give you time to turn the switch back off.
 - Leaving the switch in the on position will cycle through the panels at 1 per second.

Warnings will display in the "off" panel using the settings from panel 0. The panel will not change.
 - If they are turned off in panel 0 they won't display.
 - I know you won't like this format Gabor, but I do so we'll have to agree to disagree. Sorry.

The OSD toggle switch settings won't be saved from the config tool.
 - It will default to Flight Mode toggle and you'll have to change it in the OSD setup menu.
 - This was by design since the new default overrides channel 5 with Flight Mode toggle and I use Ch 5.

The ladders on the sides of the artificial horizon have been removed to save space.
 - The little triangles to mark the level position remain.

Some other useless bits of code were removed. You'll never notice. Find them if you like. :)

Probably some other things were changed that I don't remember. :)
 - One of them is the osd_off variable. It was removed since panels make it redundant.
 - The setup menu is now in the "off" panel.