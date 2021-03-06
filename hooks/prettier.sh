#!/bin/sh
jsfiles=$(git diff --cached --name-only --diff-filter=ACM "*.js" "*.jsx" "*.json" | tr '\n' ' ')
[ -z "$jsfiles" ] && exit 0

# Prettify all staged .js files
echo "$jsfiles" | xargs ./node_modules/.bin/prettier --config .prettierrc --write

# Add back the modified/prettified files to staging
echo "$jsfiles" | xargs git add

echo "Prettier successfully run!"

exit 0