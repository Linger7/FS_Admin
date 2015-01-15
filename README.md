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

1. Use the console command 'pog_add' within RCON or in-game after you've set yourself to root
Format:
pog_add STEAMID RankNumber


2. Directly add an entry to the 'pog_adminTable' within your database with the correct STEAMID and rank number.

Rank Numbers:
Owner - 1
Community President - 2
Community Manager - 3
Division Director - 4
Administrator - 5
Senior Moderator - 6
Moderator - 7
Trial Moderator - 8

Removing Administrators
========
1. Use the console command 'pog_remove' within RCON or in-game after you've set yourself to root
Format:
pog_add STEAMID


2. Directly remove the entry from the 'pog_adminTable' table within your database.