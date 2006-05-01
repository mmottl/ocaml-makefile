OCAMLMAKEFILE = ../OCamlMakefile

SOURCES = demoterm.ml
RESULT = demoterm
INCDIRS = +lablgtk
THREADS = yes

OCAMLBLDFLAGS = lablgtk.cma gtkInit.cmo gtkThread.cmo
OCAMLNLDFLAGS = lablgtk.cmxa gtkInit.cmx gtkThread.cmx

include $(OCAMLMAKEFILE)
