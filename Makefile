# Installs the info screen into Neutrino's web interface: the extension into
# the interface's extensions folder, and the former address /info/, which
# leads to it, beside it.
#
#   make install DESTDIR=<root> HTTPDDIR=<the interface's folder on the box>

HTTPDDIR ?= /share/tuxbox/neutrino/httpd
EXTDIR = $(HTTPDDIR)/extensions/info
FILES = LICENSE README.md icon.svg index.html info.js manifest.json webapp.json

install:
	install -d $(DESTDIR)$(EXTDIR)/languages $(DESTDIR)$(HTTPDDIR)/info
	install -m 0644 $(FILES) $(DESTDIR)$(EXTDIR)/
	install -m 0644 languages/*.json $(DESTDIR)$(EXTDIR)/languages/
	install -m 0644 address/index.html $(DESTDIR)$(HTTPDDIR)/info/index.html

uninstall:
	rm -rf $(DESTDIR)$(EXTDIR) $(DESTDIR)$(HTTPDDIR)/info

.PHONY: install uninstall
