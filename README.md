bashlib
=======

[![Build Status](https://travis-ci.org/BaxterStockman/bashlib.svg?branch=master)](https://travis-ci.org/BaxterStockman/bashlib)

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
autoreconf --install
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

Other
=====

Why did I write this, when the `source` builtin can already import any shell
files that exist in your `$PATH`?  The main reason is that I didn't know about
that fact until just recently :).  But putting that to one side, with `bashlib`:

- Your shell files can be nested at arbitrary depth and `require` will work, as
  long as the top directory is in `$BASHLIB`.  With plain old `source`, search
  depth == 1.
- You can manage your shell libraries independently of where you store
  executables.
- You get some limited introspection through the `bashlibinc` and `bashlibsrc`
  functions.
- `require my::awesome::module` just looks better than
  `PATH=$HOME/bin/my/awesome:$PATH; source module.sh`.
