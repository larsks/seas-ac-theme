STYLESHEETS = main.xsl blog.xsl docs.xsl code.xsl
GENERATED = $(STYLESHEETS)

%.xsl: rules/%.xml theme/theme.html
	diazocompiler -o $@ $< theme/theme.html

all: $(GENERATED)

install: all
	install -d -m 755 /etc/httpd/theme.d
	install -m 644 $(STYLESHEETS) /etc/httpd/theme.d/
	#
	install -m 644 httpd.conf /etc/httpd/conf.d/theme.conf
	install -m 644 theme/theme.css /var/www/html/theme.css
	install -m 644 theme/seaslogo.png /var/www/html/seaslogo.png

clean:
	rm -f $(GENERATED)

