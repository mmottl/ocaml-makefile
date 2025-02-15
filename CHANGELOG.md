# Changelog

## [6.39.2] - 2018-10-25

### Improved

- OPAM package for dune-release.

## [6.39.1] - 2018-09-23

### Fixed

- Packaging for OPAM 2.0.0.

## [6.39.0] - 2017-08-02

### Changed

- Switched to jbuilder and topkg.

## Changes Before Version 6.39.0

```text
2014-07-05: Moved to GitHub.

2012-07-15: Rewrote README in Markdown.

2012-06-29: Added support for mingw64.

            Thanks to Andreas Hauptmann for the patch.

2012-06-16: Replaced obselete compilation flag.

2012-02-11: Got rid of internal DINCFLAGS to improve dependency calculation.

            Thanks to Edward Schwartz <edmcman@cmu.edu> for the patch.

2012-01-30: Fixed a circular dependency bug that appeared with the newest
            GNU make (version 3.82).

            Thanks to Adrien Nader <adrien@notk.org> for the report and
            Edward Schwartz <edmcman@cmu.edu> for the patch.

2012-01-04: Fixed native code library debug build target.

            Thanks to Stéphane Glondu <glondu@debian.org> for the patch.

2011-11-13: Added extra dependency to improve parallel builds.

            Thanks to Edward Schwartz <edmcman@cmu.edu> for the patch.

2011-11-12: Replaced obsolete suffix rules and improved link flags in gtk.

2011-11-09: Fixed linking order to conform to stricter Linux linker rules.

2011-03-23: Improved handling of packed byte-code libraries.

            Thanks to Christophe Troestler <Christophe.Troestler@umons.ac.be>
            for the patch.

2009-05-08: Fixed build and installation problems on Windows.

            Thanks to Sylvain Le Gall <gildor@ocamlcore.org> for the
            patch.

2009-04-23: Fixed a build problem on MinGW.

            Thanks to Gerd Stolpmann <gerd@gerd-stolpmann.de> for
            the patch.

2008-12-30: Incorporated some fixes for Cygwin portability.

            Thanks to Christophe Troestler
            <Christophe.Troestler@umh.ac.be> for the patch.

2008-10-12: Improvements to Windows portability.

2008-10-15: Fixed portability problem on MacOS X with handling of
            packed libraries.

            Thanks to Alexy Khrabrov <alexy@khrabrov.net> for the patch.

2008-08-20: Fixed bug with packed library handling.

2008-04-28: Better support for packed libraries. No need to explicitly
            add "-for-pack <PackageName>" to the compilation flags.

            Thanks to Francisco José Valverde Albacete <fva@tsc.uc3m.es>
            for the patch.

2007-11-26: Added support for debug native code.

            Thanks to Samuel Mimram <samuel.mimram@ens-lyon.org> for
            the patch.

2007-10-12: Fixed a small build problem with packed libraries.

2007-08-20: New targets:

              * libinstall-byte-code
              * libinstall-native-code

2007-04-22: New variables:

              * LFLAGS
              * REALLY_QUIET

            The LFLAGS variable gets passed to ocamllex.
            The REALLY_QUIET variable turns off output from some commands.

            Thanks to Samuel Colin <Samuel.Colin@loria.fr> for the patch.

2007-03-07: Fixed case when RESULT has trailing whitespace.

2007-01-08: Further improvements to generation of documentation.

            Thanks to Prashanth Mundkur <prashanth.mundkur@gmail.com>
            for the patch.

2007-01-08: Fixed a linking bug with libraries: OCAML{B,N}LDFLAGS were
            doubled during the linking stage of library creation, which
            may cause problems in certain cases.

            Thanks to Anastasia Gornostaeva <ermine@ermine.pp.ru> for
            the hint.

2007-01-08: Improved building of html-documentation.

            Thanks to Prashanth Mundkur <prashanth.mundkur@gmail.com>
            for the patch.

            Added documentation for OCAMLMKLIB_FLAGS.

2006-12-26: Improved clean-doc target.

2006-12-21: Added support for Apple's Objective-C application framework.

            New variable:

              * CFRAMEWORKS

            Thanks to Joe Groff <arcata@gmail.com> for the patch.

2006-11-30: Improved documentation generation with "ocamldoc" + "ocamlfind".
            Fixed a bug in the clean target for documentation.
            Added a new "clean-all" target that also removes documentation.

            Thanks to Denis Bueno <dbueno@gmail.com> for the patch.

2006-11-22: New variable:

              * DOC_DIR

            Thanks to Prashanth Mundkur <prashanth.mundkur@gmail.com>
            for the suggestion.

2006-09-18: Fixed documentation bugs in the README.

2006-09-16: Added better support for ELF-platforms (especially with Godi).

2006-09-15: Added a partial fix for MacOS X problems with shared
            libraries.

2006-07-07: Fixed a linking problem with packed libraries.

            Thanks to John D. Ramsdell <ramsdell@mitre.org> for the patch.

2005-12-09: Improved logging of dependency calculation

2005-08-18: Small bug fix: override user supplied CFLAGS and CPPFLAGS in
            extensions.

2005-01-28: Small bug fix: do not delete LIBINSTALL_FILES during
            "rawuninstall" when we cannot change to the installation
            directory.

            Thanks to Vincenzo Ciancia <vincenzo_ml@yahoo.it> for the
            report + fix.

2004-09-03: New feature:

            ocamlyacc + preprocessing supported in the same way as with
            normal OCaml-files: specify "(*pp my_pp *)" in the first
            line to let the resulting OCaml-files be preprocessed.

            Thanks to Mark Shields <mbs@galois.com> for the patch.

2004-08-19: Improved handling of flags with C-compilers and preprocessors.

            New variable:

              * CPPFLAGS

            Thanks to Julien Cristau <julien.cristau@ens-lyon.fr> for
            the patch.

2004-08-17: Fixed another small bug with threads + ocamlfind...

2004-08-14: Fixed another small bug with threads + ocamlfind.

2004-08-02: Fixed a small bug with threads + ocamlfind.

2004-08-01: The targets "clean", "clean-up" and "clean-doc" are now
            extensible (i.e. they are defined as e.g. "clean::" instead of
            "clean:").

2004-07-15: New feature: automated packing of libraries.

            New variable:

              * LIB_PACK_NAME

            See the README for details.

2004-07-14: New variable:

              * OCAMLFIND_INSTFLAGS

            See README for details.

2004-07-12: Slightly improved compilation of C-files.

            Thanks to Matthieu Dubuget <matthieu.dubuget@metalscan.fr>
            for the hint.

2004-06-18: Small fix to prevent warnings for undefined variables.

2004-06-04: Fixed a bug in the threads-example, which called "make"
            rather than "$(MAKE)".

2004-06-03: Added requirement to README that GNU-make version 3.80 must
            be used.

2004-05-29: Fixed a small problem with ocamlfind + ocamldep.

2004-05-21: Added support for Oxridl.

            New variables:

              * OXRIDL

            Thanks to Fabian Emmes <fab@orlen.de> for the patch.

2004-05-19: Improved Windows-portability again (MSVC & MinGW).

            Thanks to Eugene Kotlyarov <ekot@narod.ru> for this large
            patch.

2004-05-15: Incorporated a small Windows-patch.

            Thanks to Eugene Kotlyarov <ekot@narod.ru> for the patch.

2004-05-10: Improved subproject handling. See "threads" for an example
            (minor change).

2004-05-04: Changed compilation of C-files: we now use ocamlc to make
            compilation more portable (the compiler may pass extra
            parameters).

2004-05-03: Incorporated a patch that prevents deletion of explicit
            header files when using camlidl.

            Thanks to Matthieu Dubuget <matthieu.dubuget@metalscan.fr>
            for the contribution.

2004-05-02: Incorporated a patch that solves some Windows-related
            problems.

            Thanks to Matthieu Dubuget <matthieu.dubuget@metalscan.fr>
            for the contribution.

2004-04-27: Fixed a bug with the "pabc"-target.

            New variable:

              * PIC_FLAGS  (default: "-fPIC -DPIC")

            This variable is automatically added to the flags of the
            C-compiler if you want to build (shared) libraries.

2004-04-24: More portable linking of dynamic C-libraries.

            Thanks to Gerd Stolpmann <info@gerd-stolpmann.de> for
            the patch.

            Added new variables:

              * OCAMLMKLIB
              * RPATH_FLAG

            Fixed a bug with ocamldoc and documented modules in
            subdirectories.

            See README for details.

2004-04-13: Made a small change to generation of latex-documentation using
            the new behaviour of OCaml-3.07+15.

            Added removal of assembler files (.s, .asm) for "make clean".

2004-03-30: Fixed some linking bugs on Windows. Thanks to Kamil Shakirov
            <kamils@inbox.ru> for the patch.

2004-03-18: Fixed a small bug with recompilation of modules
            in library directories.

            Thanks to Remi Vanicat <remi.vanicat@laposte.net> for
            the patch.

2004-03-11: Renamings to make things easier to remember:

              * subprj -> subprojs
              * SUBPRJS -> SUBPROJS

            This fits better to "PROJ_*". People will hopefully not have
            used this feature too often by now :-)

2004-03-07: NEW: added support for handling subprojects.

            New targets:

              * subprjs

            New variables:

              * SUBTARGET
              * SUBPRJS

            Support special variable patterns of the form "PROJ_*",
            where "*" is an identifier for some subproject. See README
            for details.

            Fixed a linking problem with ocamlfind + threads.

            Updated documentation.

2004-02-27: Small fix with use of "ar".

2004-02-25: Fixed small issue in camlp4-example.

2004-01-19: Exported some internal variables to satisfy users of the
            make-flag "--warn-undefined-variables".

2003-12-17: Fixed a bug with NO_CUSTOM.

2003-11-24: Added new variable (see README):

              * PPFLAGS

            Thanks to Peter Jolly <peter@jollys.org> for the patch.

2003-11-20: Allow preprocessing with ocamldoc.

2003-11-05: Added support for the Glade compiler of OCaml.

            New variables:

              * OCAML_GLADECC
              * OCAML_GLADECC_FLAGS

            Thanks to Damien Pous <Damien.Pous@ens-lyon.fr> for the patch.

2003-10-08: Added new variables (see README):

              * VMTHREADS
              * ANNOTATE

            Fixed a bug when compiling profiling native code.

2003-09-18: Added a new variable (see README):

              * PREDS

            Thanks to Alex Baretta <alex@baretta.com> for the patch.

2003-08-11: Added new target: debug-code-nolink (dcnl).

            Thanks to A. Ozmen <aoz@dmailman.com> for the patch.

2003-06-04: Added a new variables (see README):

              * RESULTDEPS

2003-03-31: Revived old library installation routines that do not rely on
            ocamlfind. They can be called under the new targets
            "rawinstall" and "rawuninstall".

            Re-entered variable:

              * OCAML_LIB_INSTALL

2003-03-18: findlib now only used when needed (improves compilation
            speed).

2003-02-24: Fixed a small problem occuring with the #line directive
            before the first comment indicating the preprocessor to use.

            Added the possibility to link packages with findlib when
            generating toplevels.

            Thanks to Chet Murthy <chet@watson.ibm.com> for the
            suggestions.

2003-02-07: Added an explanation to the README, why the order of source
            files always matters.

2003-01-07: Major update: uses "findlib" now by default.

            New variables:

              * OCAMLFIND
              * PACKS

            Removed variables:

              * USING_OCAMLFIND
              * OCAML_LIB_INSTALL

2002-11-06: Fixed a problem with compilation under win32.

            Thanks to Eugene Kotlyarov <ekot@protek36.esoo.ru> for
            the patch.

2002-10-14: Improved interaction with "ocamlfind".

            Thanks to Alessandro Baretta <alex@baretta.com> for the patch.

            New variables:

              * USING_OCAMLFIND

2002-09-17: Added support for the Cameleon tools "report" and "zoggy".

            Thanks to Alessandro Baretta <alex@baretta.com> for the
            contribution.

            New variables:

              * CAMELEON_REPORT
              * CAMELEON_REPORT_FLAGS
              * CAMELEON_ZOGGY
              * CAMELEON_ZOGGY_FLAGS

2002-08-29: Added new variable:

              * EXTLIBDIRS

            Same as "LIBDIRS", but paths in this variable are also added
            to the binary via the "-R"-flag so that dynamic libraries
            in non-standard places can be found.

            Thanks to Luc Habert <lhabert@sequoia.ens.fr> for the
            suggestion.

2002-08-17: Small patch by Tim Freeman <tim@fungible.com> to fix
            creation of toplevels.

2002-08-16: Applied another patch by Tim Freeman <tim@fungible.com>
            to provide for recompilation when user libraries in other
            directories change.

            Applied a patch by Yutaka OIWA <oiwa@yl.is.s.u-tokyo.ac.jp>
            for better support of threads with VisualC under Windows.

2002-08-14: Applied patch (courtesy of Tim Freeman <tim@fungible.com>):

            Added new variable "QUIET": unsetting it (e.g. "make QUIET=")
            will print all executed commands, including intermediate
            ones. This allows more comfortable debugging when things go
            wrong during a build.

            Fixed an issue with the building of byte-code libraries
            that make use of threads.

2002-08-08: Fixed a bug with -threads and native code (linking order).

            Added GTK/threads-example.
            (Courtesy of Tim Freeman <tim@fungible.com>).

2002-08-06: Turned on make-option ".DELETE_ON_ERROR" to remove target
            files generated by failing commands.

            Fixed a bug with -threads and byte code (linking order).

2002-08-04: Fixed a small bug that occurs due to interference of the
            recently added support for the "-pack"-flag.

2002-07-25: Added new targets for generation of packed object files:

              * pack-byte-code    (pabc)
              * pack-native-code  (panc)

2002-07-01: Added option "NO_CUSTOM" to prevent linking in custom mode.

2002-06-10: Pedantry:

            Initialized some variables that actually get set on
            recursive calls. This should satisfy users of the make-flag
            "--warn-undefined-variables".

2002-05-05: Fixed a bug with the generation of byte-code libraries that
            depend on shared C-libraries.

2002-05-04: Removed a superfluous dependency for native-code libraries.

2002-05-02: Renamed OcamlMakefile to OCamlMakefile for beauty :-)

            Removed variables:

              BASE_CLIB

            Introduced new variables:

              * CAMLIDLDLL
              * RES_CLIB_SUF
              * STATIC

2002-04-30: Removed requirement for interactive confirmation during
            installation of libraries.

2002-04-26: Update to support the new version of camlidl (1.03).

            The new camlidl fixes the naming problem associated
            with generated .c-files by appending "_stubs" to the
            basename of the IDL-file. In previous versions there
            was a clash with .o-files generated by C and OCaml (from
            .ml-files). OCamlMakefile used a workaround to prevent this.

            Please upgrade camlidl.

2002-03-01: Small fix to prevent (harmless) relinking of libraries.

2002-02-27: Fixed a small bug with compilation of C-files under
            Windows.

2002-02-12: Added support for ocamldoc. See README for details.

2002-02-07: Fixed a small problem with the passing of "-o" to the
            C-compiler: some compilers are a bit picky on this.

2002-02-05: Added two new targets:

              * byte-code-nolink    (bcnl)
              * native-code-nolink  (ncnl)

            These targets drop the linking stage, i.e. they compile only.

2001-11-20: Merged in a large patch (thanks to Dmitry Bely!):

              * allows OCamlMakefile to work in Windows environments
                with MinGW and also MSVC.

              * support for C++-files (variables: CXX, CXXFLAGS)

              * allows building of DLLs (targets: bcd, ncd)

            Read the README for details.

2001-11-19: Updated contact address.

2001-11-17: Added default for LIBINSTALL_FILES (see README).

2001-10-30: Fixed camlp4-example to work with upcoming OCaml-release.

2001-10-03: Added a patch that makes OCamlMakefile work better with
            MSVC under Windows (thanks to Eugene Kotlyaro!).

2001-10-01: Added the flag "-c" to the install program to prevent
            files from being moved instead of copied on MacOS X (thanks
            to Hideo Bannai for the hint!).

2001-09-07: Improved building of libraries (thanks to Hideo Bannai!):

            OCamlMakefile now links all object files into a file
            "lib$(RESULT).a". This makes it easier to use libraries that
            interface to C (e.g. no passing of "-noautolink" and of object
            files when linking against the generated library when it is
            in a different directory, only "-cclib -l$(RESULT)").

            New variable: BASE_CLIB (see README for documentation)

            Better error message when user tries to build multi-threaded
            byte code for profiling (impossible with the current
            OCaml-release).

            Improved preprocessor detection (thanks to Olivier Andrieu!)

2001-09-06: Fixed portability problem (Digital Unix) and a tiny bug
            (empty files wouldn't get compiled).

2001-09-05: MAJOR CHANGE: added support for preprocessing! You'll need
            OCaml-3.03 or higher for this (currently not yet released
            but also works with current CVS-version).

            Added new variables (see README for documentation):

              CAMLP4
              USE_CAMLP4
              PRE_TARGETS

2001-07-12: Added new target: "make cleanup". It is similar to "make
            clean" but leaves executables in the directory.

2001-06-30: Removed "Printexc.catch" from calc-example: is going to be
            deprecated in upcoming OCaml-release.

2001-03-19: Added GNU-license.

2001-01-24: If not set in the environment, the variable "OCAMLLIBPATH"
            is now initialised using "$(OCAMLC) -where" by default:
            this takes the path as known by the byte code compiler.

            If this failes (e.g. if you use an earlier version of OCaml
            that does not support this feature), the default path is
            "/usr/local/lib/ocaml".

2000-12-23: The variable "OCAMLLIBPATH" is now initialised using
            "$(OCAMLC) -where" by default: this takes the path as known
            by the byte code compiler.

2000-11-21: Added default values:

            SOURCES := foo.ml
            RESULT  := foo

            This is quite useful if you want to test something quickly
            without having to enter these variables (only the directive
            "-include" for "make").

            Changed linking order of object files and library files. Some
            linkers seem to be picky about this.

2000-09-15: Patched IDL-demo:

            The new IDL-compiler (camlidl) always maps pointers to
            optional values now. This required a minor update.

2000-06-24: Improved portability:

            Used "printf" instead of "echo" to print some messages for
            library installation: "echo" just does not behave portably
            enough.

2000-06-13: And another small change:

            OCamlMakefile did not compile C-object files when building
            byte-code libraries that use them. The new linking semantics
            links them only when they are used in an executable,
            anyway. But still: this is inconvenient, because this would
            require the user to compile them extra.

            Now OCamlMakefile will guarantee that all the object files
            exist.

            Updated the README with more details on how OCaml links
            C-object files.

2000-06-11: Phew! A major internal cleanup - now it really shines ;-)

            Fixed a few bugs that do not appear in "normal" projects (e.g.
            profiling of libraries + threads, sources in subdirectories).

            New (implicit) feature: if you have sources in subdirectories,
            OCamlMakefile will add their paths automatically to all
            compilers to ensure that they find everything they need. Again
            less work for you - more for me ;-)

            Added a bit more documentation to the README.

            Is there still any missing feature? - Oh, yes, it should
            write the code for you...

2000-06-08: Added routines for automatic (un)installation of libraries:

            See the README for details on this new feature.

            Small fix:

            Changed order in which include- and library directories are
            searched during compilation and linking: the default paths
            (OCAML_DEFAULT_DIRS and OCAMLLIBPATH) come last now. This
            prevents that new packages accidently link against already
            existing libraries instead of using their own.

2000-06-07: Greatly improved dependency handling:

            The newest OCaml-release (3.00) introduces a new flag for
            "ocamldep" that allows to correctly build dependencies for
            native code projects. OCamlMakefile uses it and handles
            dependencies now as follows (instead of using a dirty
            sed-hack):

            Instead of writing them all into the directory of the sources,
            three subdirectories are created (dot dirs):

              ._d    - contains dependencies for .ml-files
              ._bcdi - contains byte code dependencies for .mli-files
              ._ncdi - contains native code dependencies for .mli-files

            Additionally, the endings of the dependency files have
            changed: ".d" for those generated from ".ml"-files, ".di"
            for ones derived from ".mli"-files.

            This cleans up the main directory and makes the whole
            dependency handling more transparent. Additionally, no matter
            whether you use byte- or native code, it should now always
            build things 100% ok.

            ---------------------------------------------------------------

            Removed variable "PLIBS" again: the new compiler remembers
            C-libraries that have to be linked with OCaml-libraries. This
            greatly simplifies handling of libraries.

2000-06-05: New feature (thanks to Chris Quinn!):

            When compiling to native code, OCamlMakefile will
            automatically add the flag "-DNATIVE_CODE" to your CFLAGS.
            You can exploit this in your C-files by adding preprocessor
            directives. This might be necessary if you want your C-code
            to behave differently when used with a specific binary format.

2000-05-03: Nice new feature: compilation with debugging information

            New targets:

              debug-code         (dc)
              debug-code-library (dcl)

            This allows you immediate application of "ocamldebug" to
            generated binaries.

            Updated README.

2000-04-21: Pedantry:

            Initialized some variables that actually get set on recursive
            calls. This should satisfy users of the make-flag
            "--warn-undefined-variables".

2000-04-20: New feature (thanks to Julian Assange for the contribution):

            Can build toplevels now - adds two variables:

              TOPSUFFIX  - the suffix added to the name of the toplevel
                           (default: ".top")

              OCAMLMKTOP - name of the toplevel compiler
                           (default: "ocamlmktop")

            New target for this functionality: top

            So "make top" will build a new toplevel for you...

2000-02-29: Small fix (thanks to Patrick Goldbronn for the bug report):

            Setting the flag "NOIDLHEADER" suppresses generation of
            the C-header-file. Since there is are dependencies on this
            file, OCamlMakefile will try to build it (using camlidl) and
            rebuilds everything that depends on the IDL-file: this should
            not happen. When "NOIDLHEADER" is set, OCamlMakefile will
            now simply create (touch) an empty header file to prevent
            unwanted recompilations.

2000-02-28: Small fix (thanks to Dana Harrington):

            If you compiled C-files in subdirectories with OCamlMakefile,
            the object files would be wrongly written into the
            directory where "make" was issued, leading to problems
            during linking. They will be written to the corresponding
            subdirectory now.

1999-12-25: Small fix that allows using .mli-files without .ml-files.

1999-12-13: Order of compilation changed:

            Until now all interface files were compiled first, then all the
            implementations. Now, both the interfaces and the implementations
            are compiled in exactly the same order as specified in the
            Makefile.

            This change prevents superfluous recompilation of some native code
            files.

            Squeezed a bug when compiling interfaces for profiling.

1999-12-07: Workaround for a problem with ocamldep when applying it to
            interface files (would only appear under rare circumstances
            when compiling to native code): now, the output of ocamldep
            is rewritten to something more general.

1999-11-17: New variable (yes, the number of features is always n+1!):

            OCAML_DEFAULT_DIRS -
              variable containing paths to the user's default libraries. The
              intention is to pass this as an environment variable rather than
              through the Makefile - quite convenient.

1999-10-21: Lots of changes:

            Profiling is now supported - for all kinds of targets.

            Additional variables:

              OCAMLBLDFLAGS - flags passed to the OCaml-linker when linking
                              byte code
              OCAMLNLDFLAGS - flags passed to the OCaml-linker when linking
                              native code

              OCAMLCP       - name (location) of profiling byte code compiler
              OCAMLCPFLAGS  - flags passed to the profiling byte code compiler

            Added target names for profiling support:

              profiling-byte-code           (pbc)
              profiling-native-code         (pnc)
              profiling-byte-code-library   (pbcl)
              profiling-native-code-library (pncl)

            Fixed small bug: OCAMLLIBPATH was not exported

            Updated documentation with information on profiling.

1999-10-20: Further variable:

            CC - The compiler to be used on C-files.

1999-10-13: Further variable:

            PLIBS - Plain libraries.
            Useful if you want to link against libraries that
            consist of the *.cma/*.cmxa file (no C-library) only.

1999-09-11: Added two further variables:

            BCSUFFIX - is added to the basename of byte-code executables
                       and libraries
            NCSUFFIX - as above, but for native-code files

1999-09-10: Small bugfix: interfaces were not compiled with correct flags.

1999-09-09: Added two further flags:

            OCAMLBCFLAGS - special flags for byte code compilation only
            OCAMLNCFLAGS - special flags for native code compilation only

1999-09-01: Added CVS-info in OCamlMakefile

1999-08-29: Bugfix:

            Now and for all times: dependency calculation should be
            correct (I hope so ;-). The output of "ocamldep" is not
            modified anymore.

            Recompilation of *native code* will take somewhat longer
            than before, because cross-module inlining is respected now.
            Byte code will still compile in optimum time.

1999-08-26: Small bugfixes:

            Handles .mli-files without corresponding .ml-files correctly.
            Long dependency lists will not be wrongly truncated anymore.

            Updated README.

1999-07-29: Small bugfix: the C-compiler gets it's include-path
            now as "-Ipath", not as "-I path". Strictly standard
            conforming compilers obviously need this.

1999-07-27: Pass C-files directly to the C-compiler found in "$(CC)".

            Added variables:

            * CFLAGS
              Will be passed to the C-compiler as usual.

            * OCAMLLIBPATH
              Needed to tell the C-compiler, where it can find
              include-files and libraries of the OCaml-system.
              Default: "/usr/local/lib/ocaml"

            Renamed a variable:

            * LDFLAGS -> OCAMLLDFLAGS
              OCAMLLDFLAGS is equivalent to the former LDFLAGS.
              LDFLAGS is now used to pass options to the C-linker.

              Eg.: LDFLAGS = -Xlinker -verbose

              These flags will be correctly passed by the OCaml-linker
              to the C-linker (via -ccopt).

            Updated documentation on these changes.

1999-06-05: Nearly completely rewritten distribution
            Now correct (!) handling of dependencies of automatically
            generated sources.

            Can handle IDL-files with associated C-files now, too.
            Much more user-friendly.


1999-03-04: Better interface handling in SubMakefile (still not fully
            correct).
            GNU-make is a real beast.

1999-01-07: Added variable for linking in thread-support


1998-09-06: Small change to circumvent a bug which can appear
            when a user forgets to put or places a wrong file into the
            source variable: Infinite recursion due to not solvable
            dependencies.
```
