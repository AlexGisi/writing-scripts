#!/bin/zsh

# Check if the user provided an argument
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <name>"
  exit 1
fi

name="$1"

# Create a new directory with the given name
mkdir -p "${name}"

# Copy the essayTemplate.tex file into the new directory and rename it
cp "/Users/alex/Documents/Writing/EssayTemplate/essayTemplate.tex" "${name}/${name}.tex"

# Copy the style
cp "/Users/alex/Documents/Writing/EssayTemplate/styling.css" "${name}/styling.css"
cp "/Users/alex/Documents/Writing/EssayTemplate/insertHeader.py" "${name}/insertHeader.py"
cp "/Users/alex/Documents/Writing/EssayTemplate/Makefile" "${name}/Makefile"

# Insert custom name into build tools.
sed -i ''  "s/essayTemplate/${name}/g" "${name}/Makefile"

