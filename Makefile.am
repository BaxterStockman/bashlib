bin_SCRIPTS = bashlib
CLEANFILES = $(bin_SCRIPTS)
EXTRA_DIST = bashlib.in

bashlib_subst = \
	sed -e 's,[@]libdir[@],$(libdir),g' \
		-e '/[@]otherlibdirs[@]/ { s,[@]otherlibdirs[@],$(otherlibdirs),g; s,:,\n    ,g }'

bashlib:
	$(bashlib_subst) < $(srcdir)/bashlib.in > bashlib
	chmod +x bashlib
