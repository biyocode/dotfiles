#!/bin/bash
#++ Entry point for themer
ARGS=( "$@" )
function check_config_path() {
  # Checks if component's config file exists
  if [[ -f "$1" ]]
  then
    echo "Found config file:"
    echo " > $1"
  else
    echo "Could not find config file:"
    echo " > $1"
    exit 1
  fi
}
function create_backup() {
  # Create backup file based on amount of backups that already exists
  len_query=$(ls -l backups/ | grep "$1*" | wc -l)
  len=$(expr $len_query + 1)
  backup_file=""$f".backup."$len""
  cat $2 >> backups/$backup_file
  echo "... Created $backup_file in backups/"
}
main() {
  if [[ "${ARGS[0]}" == "apply" ]]
  then
    for f in $(ls components/);
    do
      if [[ "$f" != 'template' ]]
      then
        # cmd:apply theme
        source "components/"$f""
        temp=""${f^^}"_PATH"
        comp_path=${!temp}
        check_config_path $comp_path
        temp=""${f^^}"_THEME"
        comp_end=${!temp}
        create_backup $f $comp_path
        # loop through theme variable
        # sed through each item in main config

        # cmd:save $name
        # save current main component (in home) config files as a profile
        # reverse key search from components -> config file
        # split by /t and /n
        # save to profiles/$name/components*

        # cmd:delete $name
        # delete profile

        #cmd:load $name
        # loads themes from profiles/$name/components*
      fi
    done
  elif [[ "${ARGS[0]}" == "revert" ]]
  then
    # cmd:revert
    # get amount of backups for recent backup file#, then cp that to main folder
    echo "reverting"
  elif [[ "${ARGS[0]}" == "save" ]]
  then
    echo "saving"
  elif [[ "${ARGS[0]}" == "delete" ]]
  then
    echo "deleting"
  elif [[ "${ARGS[0]}" == "load" ]]
  then
    echo "loading"
  else
    echo "${ARGS[0]} not a command"
  fi
}
main
