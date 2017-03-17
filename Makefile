all: index.md
	pandoc -s --mathjax -t revealjs -o index.html \
		index.md \
		story.md \
		tufao.md \
		more_story.md \
		today.md \
		overview.md \
		parser.md \
		nodejs.md
