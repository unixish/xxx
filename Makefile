include config.mk

BIN = 3xinfo 3xbuild

all: $(BIN)

3xbuild:
	echo '#!/bin/rc' > 3xbuild
	echo >> 3xbuild
	echo repo = '$(REPODIR)' >> 3xbuild
	echo >> 3xbuild
	cat 3xbuild.rc >> 3xbuild
	chmod 0755 3xbuild

3xinfo:
	echo '#!/bin/rc' > 3xinfo
	echo >> 3xinfo
	echo repo = '$(REPODIR)' >> 3xinfo
	echo >> 3xinfo
	cat 3xinfo.rc >> 3xinfo
	chmod 0755 3xinfo

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	for b in $(BIN); do cp -f $$b $(DESTDIR)$(PREFIX)/bin/$$f; done

uninstall:
	for b in $(BIN); do rm -f $(DESTDIR)$(PREFIX)/bin/$$b; done

clean:
	rm -f $(BIN)

.PHONY: all install uninstall clean
