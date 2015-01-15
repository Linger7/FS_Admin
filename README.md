FS_Admin
========

Administration Addon for GarrysMod


Installation Instructions
========

1. Extract to Addons Folder
2. Update fs_sv_ranks.lua with your database information (Host, Username, Password, Database Name)


Adding Administrators
========
Either method 1 or 2 will work.

1. Use the console command 'pog_add' within RCON or in-game after you've set yourself to root<br />
Format:<br />
pog_add STEAMID RankNumber


2. Directly add an entry to the 'pog_adminTable' within your database with the correct STEAMID and rank number.

Rank Numbers:<br />
Owner - 1<br />
Community President - 2<br />
Community Manager - 3<br />
Division Director - 4<br />
Administrator - 5<br />
Senior Moderator - 6<br />
Moderator - 7<br />
Trial Moderator - 8<br />

Removing Administrators
========
1. Use the console command 'pog_remove' within RCON or in-game after you've set yourself to root<br />
Format:<br />
pog_add STEAMID


2. Directly remove the entry from the 'pog_adminTable' table within your database.