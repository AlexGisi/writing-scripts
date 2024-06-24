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
cp "/Users/alex/Documents/Writing/ReportTemplate/reportTemplate.tex" "${name}/${name}.tex"

# Copy the style
cp "/Users/alex/Documents/Writing/ReportTemplate/styling.css" "${name}/styling.css"
cp "/Users/alex/Documents/Writing/ReportTemplate/insertHeader.py" "${name}/insertHeader.py"
cp "/Users/alex/Documents/Writing/ReportTemplate/Makefile" "${name}/Makefile"
cp "/Users/alex/Documents/Writing/ReportTemplate/ieee-format.csl" "${name}/ieee-format.csl"
cp "/Users/alex/Documents/Writing/ReportTemplate/reportTemplate.bib" "${name}/${name}.bib"

# Insert custom name into build tools.
sed -i ''  "s/reportTemplate/${name}/g" "${name}/Makefile"

