#!/bin/bash
if [ -z $1 ]; then
  CODE_SERVER_PATH="/usr/lib/code-server"
else
  CODE_SERVER_PATH="$1"
fi

WORKBENCH_PATH="$CODE_SERVER_PATH/lib/vscode/out/vs/workbench"
WORKBENCH_CSS_PATH="$WORKBENCH_PATH/workbench.web.api.css"

# Check if it is valid path
if [ -z "$CODE_SERVER_PATH" -o ! -d "$WORKBENCH_PATH" ]; then
  echo "Please give valid code-server path!"
  exit 1
fi

# Copy fonts to $WORKBENCH_PATH
cp -rn ./resources/fonts "$WORKBENCH_PATH/"

# Prepend fonts.css to workbench.web.api.css
if ! grep -q FiraMonoForPowerline "$WORKBENCH_CSS_PATH"; then
  echo "$(cat ./resources/fonts.css)\n$(cat $WORKBENCH_CSS_PATH)" > $WORKBENCH_CSS_PATH
fi

echo "Done! Have fun!"
