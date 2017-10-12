# idris-patricia

[![Build status](https://secure.travis-ci.org/ChShersh/idris-patricia.svg)](http://travis-ci.org/ChShersh/idris-patricia)
[![MIT license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/vrom911/hs-init/blob/master/LICENSE)

This package implements map from integer key to values. Data structure can be used as persistent array. Implementation is based on article about patricia trees and on [existing Haskell implementation](https://hackage.haskell.org/package/containers-0.5.10.2/docs/Data-IntMap-Lazy.html) from [`containers`](http://hackage.haskell.org/package/containers) package. Dependent types can help to ensure some invariants for data structure.

## How to build

### Nix

Just run this command to build project and run tests.

```bash
nix-shell -A idris-patricia --command "bash install-dependencies.sh && idris --testpkg patricia-nix.ipkg --idrispath dependencies/specdris/src"
```

### No-Nix

1. Install [`specdris`](https://github.com/pheymann/specdris) following instructions from repository.
2. Run `idris --testpkg patricia.ipkg`.
