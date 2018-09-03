Require Import Coq.Strings.Ascii.

Load Trie.

Open Scope char_scope.

Definition empty := empty_trie ascii nat.

Definition hello := trie_insert ascii_dec empty ["h"; "e"; "l"; "l"; "o"] 1.

Definition happy := trie_insert ascii_dec hello ["h"; "a"; "p"; "p"; "y"] 2.

Definition world := trie_insert ascii_dec happy ["w"; "o"; "r"; "l"; "d"] 3.

Compute world.

Compute trie_get ascii_dec world ["h"; "a"; "p"; "p"; "y"].