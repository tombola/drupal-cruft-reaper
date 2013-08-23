#Strip a drupal installation 
##of unused modules

####Intended to improve performance when refreshing module cache when modules have accumulated during development

* 'delete all' script deletes module folders for every module that is listed as 'Not installed' (rather than enabled/disabled)
* 'delete each' script asks for confirmation for each module that is deleted

Both scripts save a tar'd backup of the module files in the current directory

To use: drop script in the appropriate sites/* folder (with settings.php), make executable:

    chmod +x delete_all_noinstall_mods.sh 

and either run from terminal or double 
click.

**Important**: These scripts/functions cannot currently distinguish submodules 
*e.g. view_ui - it would delete even though it is part of views module (site should still work fine)*
