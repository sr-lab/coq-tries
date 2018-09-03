Require Import Coq.Strings.Ascii.

Load Trie.

Open Scope char_scope.

(* Let's add a few words to a trie mapping lists of ASCII characters to natural numbers. *)

Definition empty := empty_trie ascii nat.

Definition hello := trie_insert ascii_dec empty ["h"; "e"; "l"; "l"; "o"] 1.

Definition happy := trie_insert ascii_dec hello ["h"; "a"; "p"; "p"; "y"] 2.

Definition world := trie_insert ascii_dec happy ["w"; "o"; "r"; "l"; "d"] 3.

(* Compute the whole trie. *)

Compute world.

(* Grab a value from the tree. *)

Compute trie_get ascii_dec world ["h"; "a"; "p"; "p"; "y"].
