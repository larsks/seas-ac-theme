GENERATED = main.xsl blog.xsl

all: $(GENERATED)

install: all
	install -d -m 755 /etc/httpd/theme.d
	install -m 644 main.xsl /etc/httpd/theme.d/main.xsl
	install -m 644 blog.xsl /etc/httpd/theme.d/blog.xsl
	install -m 644 httpd.conf /etc/httpd/conf.d/theme.conf
	install -m 644 theme/theme.css /var/www/html/theme.css
	install -m 644 theme/seaslogo.png /var/www/html/seaslogo.png

blog.xsl: rules-blog.xml theme/theme.html
	diazocompiler -o $@ rules-blog.xml theme/theme.html

main.xsl: rules-main.xml theme/theme.html
	diazocompiler -o $@ rules-main.xml theme/theme.html

clean:
	rm -f $(GENERATED)

