STYLESHEETS = main.xsl \
	      blog.xsl \
	      docs.xsl \
	      code.xsl

STATIC = theme/theme.css \
	 theme/theme.html \
	 theme/seaslogo.png

GENERATED = $(STYLESHEETS)

%.xsl: rules/%.xml theme/theme.html
	diazocompiler -o $@ $< theme/theme.html

all: $(GENERATED)

install: all
	install -d -m 755 /etc/httpd/theme.d
	install -m 644 $(STYLESHEETS) /etc/httpd/theme.d/
	install -m 644 $(STATIC) /var/www/html/
	install -m 644 httpd.conf /etc/httpd/conf.d/theme.conf

clean:
	rm -f $(GENERATED)

