all:
	pandoc -s --self-contained -o sdl_id.html -M title="Seedling identification" -V title="" sdl_id.md
	pandoc -s --self-contained -o names.html -M title="Seedling identification" -V title="" names.md
	mv -f *.html ../herbarium/guide/
