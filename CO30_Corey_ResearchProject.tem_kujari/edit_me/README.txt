Hi, this is a simple set of considerations to keep in mind if you are new to working with these files.

For now, you'll only want to edit everything that is within "briefing.sqf" and "description.ext" as stated by the "edit_me" folder that contains them.

For briefing.sqf:
You'll want to scroll down to all the "_player createDiaryRecord" sections.
You ONLY want to edit the text that is after the <br/> in each one of those sections,
the <br/> indicates the beginning of each sentence, so you wanna use <br/> at the beginning of each paragraph.
The code doesn't read space breaks, so if you want a space break (leaving a space between to paragraphs) you'll
just use an empty <br/> followed by the one with the text you want. That is how the formatting works for this section.
If you don't know what to put in one of those fields (e.g. terrain considerations) or don't have ideas, don't force them, just write "N/A" or "Unknown" instead.

For description.ext:
You wanna edit text in "quotation marks" for OnLoadName, OnLoadMission, and Author, by default, the template is self-explanatory on what each one of these is.
Remember to edit the contents between the braces "synixe_start_time"; this is in HH,MM format. Set it accordingly to the mission start time you wanted,
this will be useful incase your mission gets loaded in the server early. It'll make it automatically offset so that it will be the start time you desired
by Synixe's operation start time.

Hope you find this useful,
Felix de Jong