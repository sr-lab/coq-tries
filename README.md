# Generic Tries in Coq
This library implements generic tries in Coq, capable of mapping a list of any type to values in another (or the same) type with fast lookup times (linear on the length of the key list) at the expense of greater memory consumption and slower insertion times.

## Usage
Let's start by defining an empty tree that will map a list of ASCII characters (i.e. a string) to a natural number:

```coq
Definition empty := empty_trie ascii nat.
```

We can now insert pairs of strings and natural numbers into the trie:

```coq
Definition hello := trie_insert ascii_dec empty ["h"; "e"; "l"; "l"; "o"] 1.
Definition happy := trie_insert ascii_dec hello ["h"; "a"; "p"; "p"; "y"] 2.
Definition world := trie_insert ascii_dec happy ["w"; "o"; "r"; "l"; "d"] 3.
```

Upon calling `Compute world.` we get the following:

```coq
= Root None
  [Node None "w" [Node None "o" [Node None "r" [Node None "l" [Node (Some 3) "d" []]]]];
   Node None "h"
     [Node None "a" [Node None "p" [Node None "p" [Node (Some 2) "y" []]]];
      Node None "e" [Node None "l" [Node None "l" [Node (Some 1) "o" []]]]]]
 : Trie ascii nat
```

To retrieve a value, we can do so thusly:

```coq
Compute trie_get ascii_dec world ["h"; "a"; "p"; "p"; "y"].
```

This gives the result:

```coq
= Some 2
  : option nat
```

## Limitations
This data structure does not have any accompanying proofs. This may be addresed in the future.
