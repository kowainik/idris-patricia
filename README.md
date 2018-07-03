# idris-patricia

[![Build status](https://secure.travis-ci.org/kowainik/idris-patricia.svg)](http://travis-ci.org/kowainik/idris-patricia)
[![MIT license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/kowainik/idris-patricia/blob/master/LICENSE)

This package implements map from integer key to values. Data structure can be used as persistent array. Implementation is based on article about patricia trees and on [existing Haskell implementation](https://hackage.haskell.org/package/containers-0.5.10.2/docs/Data-IntMap-Lazy.html) from [`containers`](http://hackage.haskell.org/package/containers) package. Dependent types can help to ensure some invariants for data structure.

## REPL examples

```idris
λΠ> the (Int32Map String) $ insert 3 "a" Empty
Leaf (MkBits 3) "a" : IntBitMap 32 String

λΠ> the (Int32Map String) $ delete 3 $ insert 3 "a" Empty
Empty : IntBitMap 32 String

λΠ> the (Int32Map String) $ insert 2 "c" $ insert 4 "b" $ insert 3 "a" Empty
Bin (MkBits 3)
    (FS (FS FZ))
    (Bin (MkBits 2) FZ (Leaf (MkBits 2) "c") (Leaf (MkBits 3) "a"))
    (Leaf (MkBits 4) "b") : IntBitMap 32 String

λΠ> toList $ the (IntBitMap 32 String) $ insert 2 "c" $ insert 4 "b" $ insert 3 "a" Empty
["c", "a", "b"] : List String
```

## How to build

### Nix

Just run this command to build project and run tests.

```bash
nix-shell -A idris-patricia --command "bash install-dependencies.sh && idris --testpkg patricia-nix.ipkg --idrispath dependencies/specdris/src"
```

### No-Nix

1. Install [`specdris`](https://github.com/pheymann/specdris) following instructions from repository.
2. Run `idris --testpkg patricia.ipkg`.
