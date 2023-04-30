run:
	nvim --cmd "set rtp+=./" -o lua/edit-markdown-table/init.lua -o doc/example.md

help:
	nvim --cmd "set rtp+=./" --cmd 'h edit-markdown-table'

update_doc:
	md2vim README.md doc/edit-markdown-table.txt

install_deps:
	# used to convert markdown to vimdoc
	go install foosoft.net/projects/md2vim@latest
