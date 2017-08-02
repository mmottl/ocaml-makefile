#!/usr/bin/env ocaml

#use "topfind"
#require "topkg"

open Topkg

let () =
  let opams = [
    Pkg.opam_file ~lint_deps_excluding:None ~install:false "ocaml-makefile.opam"
  ] in
  Pkg.describe ~opams ~metas:[] "ocaml-makefile" @@ fun _c ->
  Ok [ Pkg.nothing ]
