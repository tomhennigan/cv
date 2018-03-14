
DOCKER='docker run -v ${PWD}:/data -it --rm -w /data hiono/texlive'
DOCKER=''

all::

html/index.html: cv.md html/head.html
	pandoc --standalone --from markdown --to html --include-in-header=html/head.html -o $@ $<

clean::
	rm -f html/index.html

tex/cv.tex: cv.md tex/template.tex
	pandoc --standalone --template=tex/template.tex --from markdown --to latex -o $@ $<

tex/cv.pdf: tex/cv.tex
	xelatex tex/cv.tex
	xelatex tex/cv.tex
	xelatex tex/cv.tex
	rm -f cv.{aux,log,out,bcf}

clean::
	rm -f tex/cv.tex
	rm -f cv.aux cv.log cv.out cv.bcf cv.pdf

html:: html/index.html
pdf:: tex/cv.pdf
all:: html pdf

gh-pages: html pdf
	cp tex/cv.pdf html/.
	tar -cf /tmp/cv.tar html
	git branch -D gh-pages || true
	git checkout --orphan gh-pages
	git rm -rf .
	rm -rf tex
	tar -xf /tmp/cv.tar
	mv html/* .
	rm -rf html tex
	git add *
	git commit -m "Add HTML version of CV $$(date)."
	git push -u origin gh-pages --force
