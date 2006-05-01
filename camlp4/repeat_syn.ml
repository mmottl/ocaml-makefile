(*pp camlp4o pa_extend.cmo q_MLast.cmo *)

open Pcaml;;

EXTEND
  expr: LEVEL "top"
    [[ "repeat"; e1 = expr; "until"; e2 = expr; "done" ->
      <:expr< do { $e1$; while not $e2$ do { $e1$; } } >> ]];
END
