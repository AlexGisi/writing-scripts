import subprocess
import sys
import re 
import os
import config

WRITING_FP = config.WRITING_FP 
template_dir = os.path.join(WRITING_FP, 'templates')
static_dir = os.path.join(WRITING_FP, 'static')

if len(sys.argv) != 2 :
     raise ValueError("Usage: one filename argument.")
elif len(sys.argv) == 2:
    fname = sys.argv[1]

essay_name = os.path.splitext(os.path.basename(fname))[0]

with open(fname, 'r') as f:
    con = f.read()

pattern = r'(<img\s+src=")img/([^"]+\.png")'
replacement = r'\1/' + essay_name + r'-img/\2'
con = re.sub(pattern, replacement, con)

pattern = r'(<link\s+rel="stylesheet"\s+href=")styling\.css(".*?\/>)'
replacement = r'\1/styling.css\2'
con = re.sub(pattern, replacement, con)

with open(os.path.join(template_dir, essay_name + '.html'), 'w') as f:
    f.write(con)

img_dir_new = essay_name + '-img'
subprocess.run(['cp', '-r', 'img', img_dir_new])
subprocess.run(['cp', '-r', img_dir_new, static_dir])

