OCAMLMAKEFILE = ../OCamlMakefile

SOURCES = demoterm.ml
RESULT = demoterm
PACKS = lablgtk2
THREADS = yes

OCAMLBLDFLAGS = lablgtk.cma gtkInit.cmo gtkThread.cmo
OCAMLNLDFLAGS = lablgtk.cmxa gtkInit.cmx gtkThread.cmx

include $(OCAMLMAKEFILE)
