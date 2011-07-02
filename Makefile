
ifeq (x$(target), x)
  TARGET=thesis
else
  TARGET=$(target)
endif

default : 
	@echo run \"make dvi\" to get DVI file
	@echo run \"make ps\"\  to get PS file
	@echo run \"make pdf\" to get PDF file

dvi : 
	latex $(TARGET).tex
	bibtex $(TARGET)
	latex $(TARGET).tex

ps : dvi
	dvips -o $(TARGET).ps $(TARGET).dvi

pdf : dvi
	dvipdf $(TARGET).dvi $(TARGET).pdf


all :
	latex thesis.tex
	bibtex thesis
	latex thesis.tex
	latex thesis.tex
	dvips thesis.dvi
	ps2pdf thesis.ps
clean:
	rm -f *.aux
	rm -f *.bbl
	rm -f *.blg
	rm -f *.lof
	rm -f *.log
	rm -f *.lot
	rm -f *.dvi
	rm -f *.pdf
	rm -f *.ps
	rm -f *.toc
