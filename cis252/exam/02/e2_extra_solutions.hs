--------------------------------------------------------------------------------
-- Exam 2 (Extra) Practice Questions: Version 1
--
-- NB: These questions are (for the most part) at least similar to (or at times)
--        even more difficult than those on the actual exam. As such, if you
--        can't solve some of these problems, don't freak out.
--
--     (It may behoove you to try and understand how/why these problems work!)
--------------------------------------------------------------------------------

fixMe = error "fix me!"

--------------------------------------------------------------------------------
-- Algebraic Data Types: BTrees (Recursive ADTs)
--
-- BTree definition lifted from CIS 252 @ Syracuse University
--------------------------------------------------------------------------------

data BTree a = Empty
             | BNode a (BTree a) (BTree a)
   deriving (Show)

tree1, tree2 :: BTree Int
tree1 = BNode 7 Empty Empty

tree2 = BNode 8 (BNode 13 Empty
                          (BNode 12 Empty Empty))
                (BNode 20 Empty Empty)

{-
    Write a function

      tinkerTree :: (Int -> Int) -> BTree Int

    such that (tinkerTree f tr) returns a new tree where each node's value has
    f applied to it.
-}

tinkerTree' :: (Int -> Int) -> BTree Int -> BTree Int
tinkerTree' _ Empty = Empty
tinkerTree' f (BNode v tr tl) = (BNode (f v) (tinkerTree' f tl) (tinkerTree' f tr))

{-
    Write a function

      unleaf :: BTree a -> BTree a

    such that (unleaf tr) adds two children (namely, a left child and a right
    child) to each leaf node, both with the same value as their parent.

    For example, (unleaf tree2) will return:
        (BNode 7 (BNode 7 Empty Empty)
                 (BNode 7 Empty Empty)
        )
-}

unleaf :: BTree a -> BTree a
unleaf Empty = Empty
unleaf (BNode v Empty Empty) = (BNode v (BNode v Empty Empty) (BNode v Empty Empty))
unleaf (BNode v tl tr) = (BNode v (unleaf tl) (unleaf tr))
