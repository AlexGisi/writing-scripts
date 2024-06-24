import sys

HEAD = """\n<h1 style="text-align: center; margin-bottom: 50px;"><a class="link-dark" href="{{ url_for("writing.index") }}">Writing</a> | <a class="link-dark" href="{{ url_for("home.index") }}">Alex Gisi</a></h1>"""

if len(sys.argv) != 2 :
	raise ValueError("Usage: one filename argument.")
elif len(sys.argv) == 2:
	fname = sys.argv[1]

with open(fname, 'r') as f:
	con = f.read()

insert_idx = con.index('<body>') + 6
con = con[:insert_idx] + HEAD + con[insert_idx:]

with open(fname, 'w') as f:
	f.write(con)
	
