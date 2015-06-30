AC_INIT([bashlib], [0.0.1], [schreibah@gmail.com])

dnl By schreibah@gmail.com

AC_CONFIG_AUX_DIR([config])
AM_INIT_AUTOMAKE([foreign -Wall -Werror dist-bzip2 dist-zip])

AC_CONFIG_FILES([Makefile])

AC_SUBST([bashlibext], [sh])
AC_ARG_VAR([otherlibdirs], [A colon-separated list of libraries to search for bashlib files])
AC_ARG_VAR([bashlibext], [The default file extension bashlib uses to identify
            which scripts to source.  'sh' unless you say otherwise])

AC_OUTPUT
