# OCamlMakefile - A Simple Generic Makefile for [OCaml](http://www.ocaml.org)-Projects

## Prerequisites

- GNU-Make version 3.80 or higher

## Pros

- It is well-tested across multiple platforms and has been used in many
  projects.

- It generates dependencies correctly by ensuring that all automatically
  generated OCaml-files exist before dependency calculation. This is the
  only way to guarantee that `ocamldep` can do its job.

- Convenience. Even fairly complex compilation processes (see example
  `calc.ml`) need only little information to work correctly, sometimes
  just about the minimum (filenames of sources).

## Cons

- It may not be a good choice in projects where many compilation units
  require different flags.

- Though it can scale to medium-sized projects, large projects with,
  for example, dependencies across multiple libraries in different
  directories are not well-supported.

  This is a general shortcoming of the already somewhat dated `make`.
  You may want to investigate the following tools to approach larger
  projects:

  - [dune](https://github.com/ocaml/dune)
  - [OMake](http://omake.metaprl.org/index.html)
  - [Ocamlbuild](https://ocaml.org/learn/tutorials/ocamlbuild)
  - [Oasis](http://oasis.forge.ocamlcore.org)

## Usage

It is recommended that first-time users take a look at the examples in the
distribution for a quick introduction. `OCamlMakefile`-projects are often so
simple that they are self-explanatory.

To create your own project, first edit a project-specific `Makefile` in the
appropriate directory. There are two ways of making use of `OCamlMakefile`:

1. Have a look at the default settings in `OCamlMakefile` and set
   them to the values that are valid on your system. For example, check
   whether the path to the standard libraries is ok, what executables shall
   be used, etc. Copy it into the directory of the project to be compiled.
   Add the following statement as last line to your `Makefile`:

   ```makefile
   -include OCamlMakefile
   ```

2. Put `OCamlMakefile` somewhere else in your system. In this case you
   will have to set the variable `OCAMLMAKEFILE` in your project-specific
   `Makefile`. This is the way in which the examples are written. Now you
   only need one version of `OCamlMakefile` to manage all of your projects!
   See the examples for details.

You will usually need to specify two further variables for your project:

- `SOURCES` (default: `foo.ml`)
- `RESULT` (default: `foo`)

Put all the sources necessary for a target into variable `SOURCES`. Then set
`RESULT` to the name of the target. If you want to generate libraries,
you should _not_ specify the suffix (`.cma`, `.cmxa`, `.a`). It will be
added automatically if you specify that you want to build a library.

```text
**      Don't forget to add the `.mli`-files, too!            **
**  Don't forget that the order of the source files matters!  **
```

The order is important, because it matters during linking due to potential
side effects caused at program startup. This is why `OCamlMakefile` does not
attempt to partially order dependencies by itself, which might confuse users
even more. It just compiles and links OCaml-sources in the order specified
by the user, even if it could determine automatically that the order cannot
be correct.

The minimum of your `Makefile` looks like this (assuming that `OCamlMakefile`
is in the search path of `make`):

```makefile
-include OCamlMakefile
```

This will assume that you want to compile a file `foo.ml` to a binary `foo`.

Otherwise, your Makefile will probably contain something like this:

```makefile
SOURCES = foo.ml
RESULT  = foo

-include OCamlMakefile
```

Be careful with the names you put into these variables. If they are wrong,
a `make clean` might erase the wrong files!

A simple `make` will generate a byte-code executable. If you want to change
this, you may add an `all`-rule that generates something else. For example:

```makefile
SOURCES = foo.ml
RESULT  = foo

all: native-code-library

-include OCamlMakefile
```

This will build a native-code library `foo.cmxa` (+ `foo.a`) from file
`foo.ml`.

You may even build several targets at once. To produce byte- and native-code
executables with one `make`, add the following rule:

```makefile
all: byte-code native-code
```

You will probably want to use a different suffix for each of these targets
so that the result will not be overwritten. See the optional variables
below for details.

You may also tell `make` at the command-line what kind of target to produce
(e.g. `make nc`). Here all the possibilities with shortcuts between
parenthesis:

```text
byte-code                      (bc)
byte-code-nolink               (bcnl) - no linking stage
byte-code-library              (bcl)
native-code                    (nc)
native-code-nolink             (ncnl) - no linking stage
native-code-library            (ncl)
debug-code                     (dc)
debug-code-nolink              (dcnl) - no linking stage
debug-code-library             (dcl)
profiling-byte-code            (pbc)
profiling-byte-code-library    (pbcl)
profiling-native-code          (pnc)
profiling-native-code-library  (pncl)
byte-code-dll                  (bcd)
native-code-dll                (ncd)
pack-byte-code                 (pabc)
pack-native-code               (panc)
toplevel                       (top)
subprojs
```

Here is a short note concerning building and linking byte code libraries
with C-files:

> OCaml links C-object files only when they are used in an executable.
> After compilation they should be placed in some directory that is in
> your include path if you link your library against an executable.
>
> It is sometimes more convenient to link all C-object files into a
> single C-library. Then you have to override the automatic link flags
> of your library using `-noautolink` and add another link flag that
> links in your C-library explicitly.

Concerning maintenance:

- `make clean` removes all (all!) automatically generated files.
  So again, make sure your variables are ok!

- `make cleanup` is similar to `make clean` but keeps executables.

Another way to destroy some important files is by having `OCamlMakefile`
automatically generate files with the same name. Read the documentation about
the tools in the OCaml-distribution to see what kind of files are generated.
`OCamlMakefile` additionally generates (`%` is the basename of source file):

- `%_idl.c` - `camlidl` generates a file `%.c` from `%.idl`, but this is
  not such a good idea, because when generating native-code, both the
  file `%.c` and `%.ml` would generate files `%.o` which would overwrite
  each other. Thus, `OCamlMakefile` renames `%.c` to `%_idl.c` to work
  around this problem.

The dependencies are stored in three different subdirectories (dot dirs):

- `._d` - contains dependencies for .ml-files
- `._bcdi` - contains byte code dependencies for .mli-files
- `._ncdi` - contains native code dependencies for .mli-files

The endings of the dependency files are: `%.d` for those generated from
`%.ml`-files and `%.di` for ones derived from `%.mli`-files.

## Debugging

This is easy: if you discover a bug, just do a `make clean; make dc` to
recompile your project with debugging information. Then you can immediately
apply `ocamldebug` to the executable.

## Profiling

To generate code that can be profiled with `ocamlprof` (byte code) or `gprof`
(native code), compile your project with one of the profiling targets (see
targets above). E.g.:

- `make pbc` will build byte code that can be profiled with `ocamlprof`.
- `make pnc` will build native code that can be profiled with `gprof`.

Please note that it is not currently possible to profile byte code with
threads. `OCamlMakefile` will force an error if you try to do this.

A short hint for DEC Alpha-users (under Digital Unix): you may also compile
your sources to native code without any further profiling options/targets.
Then call `pixie my_exec`, `my_exec` being your executable. This will produce
(among other files) an executable `my_exec.pixie`. Call it and it will produce
profiling information which can be analyzed using `prof -pixie my_exec`.
The resulting information is extremely detailed and allows analysis up to
the clock cycle level...

## Using Preprocessors

Because any kind of program that reads from standard input and prints to
standard output can be used as a preprocessor, there cannot be any default
way to handle all of them correctly without further knowledge.

Therefore, you have to cooperate a bit with `OCamlMakefile` to let
preprocessing happen automatically. Basically, this only requires that you
put a comment into the first line of files that should be preprocessed, e.g.:

```ocaml
(*pp cat *)
(* ... rest of program ... *)
```

`OCamlMakefile` looks at the first line of your files, and if it finds a
comment that starts with "`(*pp`", then it will assume that the rest of
the comment tells it how to correctly call the appropriate preprocessor.
In this case the program `cat` will be called, which will, of course, just
output the source text again without changing it.

If, for example, you were an advocate of the "revised syntax", which is
supported by the `camlp4` preprocessor, you could simply write:

```ocaml
(*pp camlp4r *)
(* ... rest of program in revised syntax ... *)
```

If you want to write your own syntax extensions, just take a look at the
example in the directory `camlp4`: it implements the "`repeat ... until`"
extension as described in the `camlp4`-tutorial.

## Library (Un-)Installation Support

`OCamlMakefile` contains two targets using `ocamlfind` for this purpose:

- `libinstall`
- `libuninstall`

These two targets require the existence of the variable `LIBINSTALL_FILES`,
which should be set to all the files that you want to install in the
library directory (usually %.mli, %.cmi, %.cma, %.cmxa, %.a and possibly
further C-libraries). The target `libinstall` has the dependency `all`
to force compilation of the library so make sure you define target `all`
in your Makefile appropriately.

The targets inform the user about the configured install path and ask for
confirmation to (un)install there. If you want to use them, it is often a
good idea to just alias them in your Makefile to `install` and `uninstall`
respectively.

Two other targets allow installation of files into a particular directory
(without using `ocamlfind`):

- `rawinstall`
- `rawuninstall`

## Building toplevels

There is just one target for this:

- `top`

The generated file can be used immediately for interactive sessions - even
with scanners, parsers, C-files, etc.!

## Generating documentation

The following targets are supported:

```text
htdoc      - generates HTML-documentation
ladoc      - generates Latex-documentation
psdoc      - generates PostScript-documentation
pdfdoc     - generates PDF-documentation
doc        - generates all supported forms of documentation
clean-doc  - generates all supported forms of documentation
```

All of them generate a sub-directory `doc`. More precisely, for HTML it
is `doc/$(RESULT)/html` and for Latex, PostScript and PDF the directory
`doc/$(RESULT)/latex`. See the OCamldoc-manual for details and the optional
variables below for settings you can control.

## Handling subprojects

You can have several targets in the same directory and manage them from
within an single `Makefile`.

Give each subproject a name, e.g. `p1`, `p2`, etc. Then you export settings
specific to each project by using variables of the form `PROJ_p1`, `PROJ_p2`,
etc. E.g.:

```makefile
define PROJ_p1
  SOURCES=foo.ml main.ml
  RESULT="p1"
  OCAMLFLAGS="-unsafe"
endef
export PROJ_p1

define PROJ_p2
  ...
endef
export PROJ_p2
```

You may also export common settings used by all projects directly, e.g.:

```makefile
export THREADS = y
```

Now is a good time to define which projects should be affected by commands
by default. E.g.:

```makefile
ifndef SUBPROJS
  export SUBPROJS = p1 p2
endif
```

This will automatically generate a given target for all those subprojects
if this variable has not been defined in the shell environment or in the
command line of the make-invocation by the user. E.g., `make dc` will
generate debug code for all subprojects.

Now you need to define a default action for your subprojects if `make`
has been called without arguments:

```makefile
all: bc
```

This will build byte code by default for all subprojects.

Finally, you'll have to define a catch-all target that uses the target provided
by the user for all subprojects. Just add (assuming that OCAMLMAKEFILE has
been defined appropriately):

%:
@make -f $(OCAMLMAKEFILE) subprojs SUBTARGET=$@

See the `threads`-directory in the distribution for a short example!

## Optional `OCamlMakefile` variables

```text
* LIB_PACK_NAME - packs all modules of a library into a module whose
                  name is given in variable LIB_PACK_NAME.

* RES_CLIB_SUF  - when building a library that contains C-stubs, this
                  variable controls the suffix appended to the name of
                  the C-library (default: _stubs).

* THREADS       - say THREADS = yes if you need thread support compiled in,
                  otherwise leave it away.

* VMTHREADS     - say VMTHREADS = yes if you want to force VM-level
                  scheduling of threads (byte-code only).

* ANNOTATE      - say ANNOTATE = yes to generate type annotation files
                  (.annot) to support displaying of type information
                  in editors.

* USE_CAMLP4    - say USE_CAMLP4 = yes in your Makefile if you
                  want to include the camlp4 directory during the build
                  process, otherwise leave it away.

* INCDIRS       - directories that should be searched for .cmi- and
                  .cmo-files.  You need not write -I ... - just the
                  plain names.
* LIBDIRS       - directories that should be searched for libraries
                  Also just put the plain paths into this variable
* EXTLIBDIRS    - Same as LIBDIRS, but paths in this variable are
                  also added to the binary via the -R-flag so that
                  dynamic libraries in non-standard places can be found.
* RESULTDEPS    - Targets on which results (executables or libraries)
                  should additionally depend.

* PACKS         - adds packages under control of findlib.

* PREDS         - specifies findlib-predicates.

* LIBS          - OCaml-libraries that should be linked (just plain names).
                  E.g. if you want to link the Str-library, just write
                  str (without quotes).  The new OCaml-compiler handles
                  libraries in such a way that they "remember" whether
                  they have to be linked against a C-library and it gets
                  linked in automatically.  If there is a slash in the
                  library name (such as ./str or lib/foo) then make is
                  told that the generated files depend on the library.
                  This helps to ensure that changes to your libraries
                  are taken into account, which is important if you are
                  regenerating your libraries frequently.

* CLIBS         - C-libraries that should be linked (just plain names).

* PRE_TARGETS   - set this to a list of target files that you want
                  to have built before dependency calculation actually
                  takes place.  E.g. use this to automatically compile
                  modules needed by camlp4, which have to be available
                  before other modules can be parsed at all.

                  ** WARNING **: the files mentioned in this variable
                  will be removed when make clean is executed!

* LIBINSTALL_FILES - the files of a library that should be installed
                    using findlib.  Default:

                      $(RESULT).mli $(RESULT).cmi $(RESULT).cma
                      $(RESULT).cmxa $(RESULT).a lib$(RESULT).a

* OCAML_LIB_INSTALL - target directory for rawinstall/rawuninstall.
                      (default: $(OCAMLLIBPATH)/contrib)

* DOC_FILES     - names of files from which documentation is generated.
                  (default: all .mli-files in your $(SOURCES)).

* DOC_DIR       - name of directory where documentation should be stored.

* OCAMLFLAGS    - flags passed to the compilers
* OCAMLBCFLAGS  - flags passed to the byte code compiler only
* OCAMLNCFLAGS  - flags passed to the native code compiler only

* OCAMLLDFLAGS  - flags passed to the OCaml-linker
* OCAMLBLDFLAGS - flags passed to the OCaml-linker when linking byte code
* OCAMLNLDFLAGS - flags passed to the OCaml-linker when linking
                  native code

* OCAMLMKLIB_FLAGS - flags passed to the OCaml library tool

* OCAMLCPFLAGS  - profiling flags passed to ocamlcp (default: a)

* PPFLAGS       - additional flags passed to the preprocessor
                  (default: none)

* LFLAGS        - flags passed to ocamllex
* YFLAGS        - flags passed to ocamlyacc
* IDLFLAGS      - flags passed to camlidl

* OCAMLDOCFLAGS - flags passed to ocamldoc

* OCAMLFIND_INSTFLAGS - flags passed to ocamlfind during installation
                        (default: none)

* DVIPSFLAGS    - flags passed to dvips
                  (when generating documentation in PostScript).

* STATIC        - set this variable if you want to force creation
                  of static libraries

* CC            - the C-compiler to be used
* CXX           - the C++-compiler to be used

* CFLAGS        - additional flags passed to the C-compiler.

                  The flag -DNATIVE_CODE will be passed automatically if
                  you choose to build native code.  This allows you to
                  compile your C-files conditionally.  But please note:
                  You should do a make clean or remove the object files
                  manually or touch the %.c-files: otherwise, they may
                  not be correctly recompiled between different builds.

* CXXFLAGS      - additional flags passed to the C++-compiler.

* CPPFLAGS      - additional flags passed to the C-preprocessor.

* CFRAMEWORKS   - Objective-C framework to pass to linker on MacOS X.

* LDFLAGS       - additional flags passed to the C-linker

* RPATH_FLAG    - flag passed through to the C-linker to set a path for
                  dynamic libraries.  May need to be set by user on
                  exotic platforms.  (default: -R).

* ELF_RPATH_FLAG - this flag is used to set the rpath on ELF-platforms.
                  (default: -R)

* ELF_RPATH     - if this flag is yes, then the RPATH_FLAG will be
                  passed by -Wl to the linker as normal on ELF-platforms.

* OCAMLLIBPATH  - path to the OCaml-standard-libraries
                  (first default: $(OCAMLC) -where)
                  (second default: /usr/local/lib/ocaml)

* OCAML_DEFAULT_DIRS - additional path in which the user can supply
                      default directories to his own collection
                      of libraries.  The idea is to pass this as an
                      environment variable so that the Makefiles do not
                      have to contain this path all the time.

* OCAMLFIND     - ocamlfind from findlib       (default: ocamlfind)
* OCAML         - OCaml interpreter            (default: ocaml)
* OCAMLC        - byte-code compiler           (default: ocamlc)
* OCAMLOPT      - native-code compiler         (default: ocamlopt)
* OCAMLMKTOP    - top-level compiler           (default: ocamlmktop)
* OCAMLCP       - profiling byte-code compiler (default: ocamlcp)
* OCAMLDEP      - dependency generator         (default: ocamldep)

* OCAMLLEX      - scanner generator            (default: ocamllex)
                  Applies to .mll files.

* OCAMLYACC     - parser generator             (default: ocamlyacc)
                  Applies to .mly files.  A good alternative to the default is
                  "menhir" if installed.

* OCAMLMKLIB    - tool to create libraries     (default: ocamlmklib)
* CAMLIDL       - IDL-code generator           (default: camlidl)
* CAMLIDLDLL    - IDL-utility                  (default: camlidldll)
* CAMLP4        - camlp4 preprocessor          (default: camlp4)
* OCAMLDOC      - OCamldoc-command             (default: ocamldoc)

* LATEX         - Latex-processor              (default: latex)
* DVIPS         - dvips-command                (default: dvips)
* PS2PDF        - PostScript-to-PDF converter  (default: ps2pdf)

* CAMELEON_REPORT - report tool of Cameleon    (default: report)
* CAMELEON_REPORT_FLAGS - flags for the report tool of Cameleon

* CAMELEON_ZOGGY - zoggy tool of Cameleon
                  (default: camlp4o pa_zog.cma pr_o.cmo)
* CAMELEON_ZOGGY_FLAGS - flags for the zoggy tool of Cameleon

* OCAML_GLADECC - Glade compiler for OCaml  (default: lablgladecc2)
* OCAML_GLADECC_FLAGS - flags for the Glade compiler

* OXRIDL        - OXRIDL-generator  (default: oxridl)

* NOIDLHEADER   - set to yes to prohibit OCamlMakefile from using
                  the default camlidl-flag -header.

* NO_CUSTOM     - Prevent linking in custom mode.

* QUIET         - unsetting this variable (e.g. make QUIET=)
                  will print all executed commands, including intermediate
                  ones.  This allows more comfortable debugging when
                  things go wrong during a build.

* REALLY_QUIET  - when set this flag turns off output from some commands.

* OCAMLMAKEFILE - location of (= path to) this OCamlMakefile.
                  Because it calls itself recursively, it has to know
                  where it is. (default: OCamlMakefile = local directory)

* BCSUFFIX      - Suffix for all byte-code files.  E.g.:

                    RESULT   = foo
                    BCSUFFIX = _bc

                  This will produce byte-code executables/libraries with
                  basename foo_bc.

* NCSUFFIX      - Similar to BCSUFFIX, but for native-code files.
* TOPSUFFIX     - Suffix added to toplevel interpreters (default: .top)

* SUBPROJS      - variable containing the names of subprojects to be
                  compiled.

* SUBTARGET     - target to be built for all projects in variable
                  SUBPROJS.
```

## Optional variables for Windows users

```text
* MINGW         - variable to detect the MINGW-environment
* MSVC          - variable to detect the MSVC-compiler
```

## Contact Information and Contributing

Please submit bugs reports, feature requests, contributions and similar to
the [GitHub issue tracker](https://github.com/mmottl/ocaml-makefile/issues).

Up-to-date information is available at: <https://mmottl.github.io/ocaml-makefile>
