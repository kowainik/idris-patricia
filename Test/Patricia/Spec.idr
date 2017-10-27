||| Testing IntMap using silly stupid tests
module Test.Patricia.Spec

import Patricia.IntMap
import Patricia.IntSet
import Specdris.Spec

----------------------------------------------------------------------------
-- Maps to test
----------------------------------------------------------------------------

initMap : Int32Map String
initMap = fromList [(1,"a"), (2,"b"), (3,"c"), (4, "d"), (4, "x")]

biggerMap : Int32Map String
biggerMap = insert 5 "e" initMap

lesserMap : Int32Map String
lesserMap = delete 10 $ delete 5 $ delete 2 biggerMap

----------------------------------------------------------------------------
-- Sets to test
----------------------------------------------------------------------------

initSet : Int32Set
initSet = fromList [1, 2, 3, 4, 4]

biggerSet : Int32Set
biggerSet = insert 5 initSet

lesserSet : Int32Set
lesserSet = delete 10 $ delete 5 $ delete 2 biggerSet

----------------------------------------------------------------------------
-- Test runner
----------------------------------------------------------------------------

export
main : IO ()
main = spec $ do
  describe "Patricia" $ do
    it "size" $ do
      size initMap   `shouldBe` 4
      size biggerMap `shouldBe` 5
      size lesserMap `shouldBe` 3
    it "lookup & insert & delete" $ do
      lookup 2 initMap   `shouldBe` Just "b"
      lookup 4 initMap   `shouldBe` Just "x"
      lookup 0 initMap   `shouldBe` Nothing
      lookup 5 biggerMap `shouldBe` Just "e"
      lookup 5 lesserMap `shouldBe` Nothing
      lookup 2 lesserMap `shouldBe` Nothing
      lookup 3 lesserMap `shouldBe` Just "c"
    it "toList" $ do
      values initMap   `shouldBe` ["a", "b", "c", "x"]
      values biggerMap `shouldBe` ["a", "b", "c", "x", "e"]
      values lesserMap `shouldBe` ["a", "c", "x"]
  describe "IntSet" $ do
    it "size" $ do
      size initSet   `shouldBe` 4
      size biggerSet `shouldBe` 5
      size lesserSet `shouldBe` 3
    it "member & insert & delete" $ do
      member 2 initSet   `shouldBe` True
      member 4 initSet   `shouldBe` True
      member 0 initSet   `shouldBe` False
      member 5 biggerSet `shouldBe` True
      member 5 lesserSet `shouldBe` False
      member 2 lesserSet `shouldBe` False
      member 3 lesserSet `shouldBe` True
