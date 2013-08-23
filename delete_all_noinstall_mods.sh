cd $(dirname $0);
dropmods=$(drush pm-list --status="Not installed" --pipe);

echo 'delete:';
echo $dropmods;

read -p "Are you sure you want to delete ALL of these modules? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]

then
  sudo mkdir deleted_modules_BAK;

  for modname in $dropmods
  do
    modpath=$(drush drupal-directory $modname)
    sudo cp -r $modpath deleted_modules_BAK;
    rm -rf $modpath;
  done
  sudo tar -cvzf deleted_modules_BAK.tar deleted_modules_BAK;
  if [[ $? == 1 ]] 
  then
    sudo rm -rf deleted_modules_BAK;
    echo "backup stored in deleted_modules_BAK.tar"
  else
  echo 'backup was not compressed, so module files still exist in backup deleted_modules_BAK';
  fi
  drush cc all;
fi