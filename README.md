CV Template
===========

**[Web Version](http://tomhennigan.github.io/cv/)**

**Disclaimer:** The fact that my CV is on GitHub (and that I am updating it) is
not an indication that I am looking for a new job. Seriously. If you are a
recruiter and contact me on here or LinkedIn I am not going to reply or connect
with you. I am not looking and when I am I will contact you.

-------------------------------------------------------------------------------

Hacking
-------

Content edits should be made to the `cv.md` file. The idea is that all content
will be changed here, and we use pandoc to transform the markdown CV betwen
formats.

Requirements (docker, pandoc):

	brew install pandoc
	brew install docker
	brew cask install virtualbox
	brew install boot2docker
	launchctl load ~/Library/LaunchAgents/homebrew.mxcl.boot2docker.plist
	ln -sfv /usr/local/opt/boot2docker/*.plist ~/Library/LaunchAgents
	eval "$(boot2docker shellinit)"

Usage:

	make pdf html
