module Patricia.IntSet

import Patricia.IntMap

%default total
%access export

public export
data IntBitSet : (bits : Nat) -> Type where
  MkIntSet : IntBitMap bits Unit -> IntBitSet bits

||| Integer set with 32 bits integers as an element.
public export
Int32Set : Type
Int32Set = IntBitSet 32

||| `O(n)`. Number of elements in `IntBitSet`.
public export
size : IntBitSet (S n) -> Nat
size (MkIntSet t) = size t

||| `O(min(n, W))`. Check if the value is in the `IntBitSet`.
public export
member : Integer -> IntBitSet (S n) -> Bool
member x (MkIntSet t) = isJust (lookup x t)

||| `O(min(n,W))`. Insert a new `value` in the `IntBitSet`.
||| If the value is already present in the set, the tree isn't changed.
public export
insert : Integer -> IntBitSet (S n) -> IntBitSet (S n)
insert x (MkIntSet t) = MkIntSet (insert x () t)

||| `O(min(n,W))`. Delete the `value` from `IntBitSet`.
||| If the value is not present in the set, the tree isn't changed.
public export
delete : Integer -> IntBitSet (S n) -> IntBitSet (S n)
delete x (MkIntSet t) = MkIntSet (delete x t)

||| Create `IntBitSet` from list of `value`.
public export
fromList : List Integer -> IntBitSet (S n)
fromList = MkIntSet . fromList . map (\x => (x, ()))
