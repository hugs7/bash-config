findnode() {
  find "${1:-.}" -type d -name node_modules -prune
}

cleannode() {
  local dir="${1:-.}"
  echo "🔍 Searching for node_modules in $dir..."
  local dirs=($(findnode "$dir"))
  local count=${#dirs[@]}
  
  if [ $count -eq 0 ]; then
    echo "✓ No node_modules directories found"
    return 0
  fi
  
  echo "🗑️  Found $count node_modules director$([ $count -eq 1 ] && echo 'y' || echo 'ies')"
  local i=0
  for nm in "${dirs[@]}"; do
    ((i++))
    echo "  [$i/$count] Removing $(dirname "$nm")/node_modules..."
    rm -rf "$nm"
  done
  echo "✅ Done! Removed $count director$([ $count -eq 1 ] && echo 'y' || echo 'ies')"
}

cleanlocks() {
  local name="$1"
  local dir="$2"
  echo "🔍 Searching for $name files..."
  local locks=($(find "$dir" -type f -name "$name"))
  local count=${#locks[@]}

  if [ $count -eq 0 ]; then
    echo "✓ No $name files found"
  else
    echo "🗑️  Found $count $name file$([ $count -eq 1 ] && echo '' || echo 's')"
    find "$dir" -type f -name "$name" -delete
    echo "✅ Removed $count lock file$([ $count -eq 1 ] && echo '' || echo 's')"
  fi
}

cleanall() {
  local dir="${1:-.}"
  echo "🧹 Cleaning up node_modules, package-lock.json, pnpm-lock.yaml..."
  echo ""

  # Remove node_modules
  cleannode "$dir"

  echo ""
  cleanlocks package-lock.json "$dir"

  echo ""
  cleanlocks pnpm-lock.yaml "$dir"

  echo ""
  echo "🎉 Cleanup complete!"
}

