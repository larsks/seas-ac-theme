all: theme.xsl

test: test.html

test.html: theme.xsl
	diazorun -x theme.xsl -o $@ content.html

install: test all
	install -d -m 755 /etc/httpd/theme.d
	install -m 644 theme.xsl /etc/httpd/theme.d/theme.xsl
	install -m 644 httpd.conf /etc/httpd/conf.d/theme.conf
	install -m 644 content.html /var/www/html/content.html

theme.xsl: rules.xml theme/theme.html
	diazocompiler -o $@ rules.xml theme/theme.html

clean:
	rm -f theme.xsl test.html

