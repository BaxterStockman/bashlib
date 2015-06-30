bin_SCRIPTS = bashlib
CLEANFILES = $(bin_SCRIPTS)
EXTRA_DIST = bashlib.in

bashlib_basename = bashlib

bashlib_subst = \
	sed -e	's,[@]libdir[@],$(libdir),g' \
		-e	'/[@]otherlibdirs[@]/ { s,[@]otherlibdirs[@],$(otherlibdirs),g; s,:,\n    ,g }' \
		-e	's,[@]bashlib_basename[@],$(bashlib_basename),g'

bashlib:
	$(bashlib_subst) < $(srcdir)/bashlib.in > bashlib
	chmod +x bashlib

install-data-local:
	mkdir -p $(DESTDIR)/$(libdir)/$(bashlib_basename)
	for dir in $$(echo $(otherlibdirs) | tr ':' ' '); do \
		mkdir -p $(DESTDIR)/$$dir ; \
	done
