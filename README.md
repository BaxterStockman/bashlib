bashlib
=======

A simple Perlish interface for sourcing shell scripts.

Usage
=====

Assuming you've got the following files:

```sh
# file: /usr/local/lib/bashlib/i/am/pretty.sh

pretty () {
    echo 'I am pretty!'
}
```

```sh
# file: $HOME/.bashlib.d/no/spoon.sh

nospoon () {
    echo 'There is no spoon.'
}
```

```sh
$> eval "$(bashlib --source)"  # A convenience wrapper around 'source /full/path/to/bashlib'
$> require i::am::pretty
$> pretty
I am pretty!
$> require no/spoon.sh
$> nospoon
There is no spoon.
$> bashlibinc
i/am/pretty.sh  /usr/local/bashlib/i/am/pretty.sh
no/spoon.sh     /home/yourusername/.bashlib.d/no/spoon.sh
```

Installation
============

`bashlib` uses `autotools` for configuration and installation.  Follow the
typical tango:

```sh
autoreconf
./configure
make
make install
```

In addition to the typical options, `configure` recognizes these environment
variables:

- `otherlibdirs`: a colon-separated list of directories.  `bashlib` will search
  for shell files in these directories in addition to the list of default
  directories.

- `bashlibext`: a file extension.  By default, it's 'sh'.

