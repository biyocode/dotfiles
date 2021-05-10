#!/bin/bash
source components/template
source components/kitty

#echo "${COMPONENT_NAME['color1']}"
START=$(grep -n "$COMPONENT_TAG_START" "$COMPONENT_PATH" | cut -d : -f 1 | tr -d '\n')
END=$(grep -n "$COMPONENT_TAG_END" "$COMPONENT_PATH" | cut -d : -f 1 | tr -d '\n')
sed -i "$START,"$END"s/color0.*/${COMPONENT_NAME['color0']}/g" "$COMPONENT_PATH"

for f in $(ls components/);
do
  if [[ "$f" != 'template' ]]
  then
    echo "$f"
    comp_path=""${f^^}"_PATH"
    echo "$comp_path"
  fi
done
