--------------------------------------------------------------------------------
-- Exam 2 Practice Questions: Version 2
--
-- NB: These questions are (for the most part) at least similar to (or at times)
--        even more difficult than those on the actual exam. As such, if you
--        can't solve some of these problems, don't freak out.
--
--     (It may behoove you to try and understand how/why these problems work!)
--------------------------------------------------------------------------------

fixMe = error "fix me!"

--------------------------------------------------------------------------------
-- Algebraic Data Types: Schedule (Non-Recursive ADTs)
--------------------------------------------------------------------------------

{-
    Within a university, we know that classes exist with students who take said
      classes. Students each have their own individual schedules, which is
      comprised of a list of classes.

    For the sake of this problem, we can assume that this university only has
      one class section per class number (so, for example, there will not be
      two sections of CIS 252).

    A class has a department identifier, a class number, and a credit count.

    A schedule is simply a list of classes. (Please note that students can have
      empty schedules, meaning that they are simply taking 0 credits.)

    A student is full-time if they are taking greater than or equal to
      12 credits, and part-time otherwise (i.e., less than 12 credits).

    NOTE: For these problems, there may exist multiple solutions - namely,
      through the use of recursion, higher order functions, list comprehensions,
      etc. It may be useful for you to try and write out as many potential
      solutions as you can for practice.

          It is also worth noting that as per usual, you may use functions you
            have previously defined in your answers.
 -}

data Dept = CIS | PHY | WRT | MAT | PHI
  deriving (Show, Eq)

data Course = Cl Dept Int Int
  deriving (Show)

type Schedule = [Course]

data Student = Fulltime | Parttime
  deriving (Show, Eq)

schedA = [(Cl CIS 252 3), (Cl PHY 211 3), (Cl PHY 221 1), (Cl WRT 105 3), (Cl MAT 295 4), (Cl PHI 251 3)]
schedB = [(Cl CIS 252 3), (Cl PHY 212 3), (Cl PHY 222 1), (Cl WRT 205 3), (Cl MAT 331 1), (Cl PHI 191 3)]
schedC = [(Cl CIS 352 3), (Cl PHY 212 3), (Cl PHY 222 1), (Cl WRT 205 3), (Cl MAT 331 1)]
schedD = [(Cl MAT 541 3), (Cl CIS 400 3), (Cl CIS 401 3)]

{-
    Write a function

      getCourseNumbers :: Schedule -> [Int]

    such that given a schedule of classes (cs), we get back a list of the course
    numbers for a particular schedule.
 -}

getCourseNumbers :: Schedule -> [Int]

{-
    Write a function

      increaseCredits :: Schedule -> schedule

    such that given a schedule of classes (cs), we increase the credit count of
    each class by 1.
-}

increaseCredits :: Schedule -> Schedule

{-
    Write a function

      equivClasses :: Course -> Course -> Bool

    such that given two classes, we can determine if they are identical.

    NB: Our definition of identical is that the department and the course number
          are the same.
-}

equivClasses :: Course -> Course -> Bool

{-
    Write a function

      inClassTogether :: Schedule -> Schedule -> Bool

    such that given two schedules, we determine if they share at least one class

    Hint: The function (or) may be of use.
 -}

inClassTogether :: Schedule -> Schedule -> Bool

{-
    Write a function

      creditCount :: Schedule -> Int

    such that given a schedule of classes (cs), we get back a list of the course
    numbers for a particular schedule.
 -}

creditCount :: Schedule -> Int

{-
    Write a function

      classifyStudent :: Schedule -> Student

    such that given a schedule of classes (cs) and a student type, we determine
      whether a student has a valid classification (i.e. fulltime or parttime)
 -}

classifyStudent :: Schedule -> Student -> Bool

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

      flipTree :: BTree a -> BTree a

    such that (flipTree tr) swaps the position of the left and right subtrees
    at each level.

    For example, (flipTree tree2) will return:
        BNode 8 (BNode 20 Empty Empty)
                (BNode 13 (BNode 12 Empty Empty)
                          Empty)
 -}

flipTree :: BTree a -> BTree a

{-
    Write a function

      treeLevel :: Int -> a -> BTree a

    such that (treeLevel n val) returns a full binary tree that is n levels deep
    with each label being val. If n is less than 0, we return an empty tree.

    For example, (treeLevel 2 44) will return:
        BNode 44 (BNode 44 (BNode 44 Empty Empty)
                           (BNode 44 Empty Empty)
                 (BNode 44 (BNode 44 Empty Empty)
                           (BNode 44 Empty Empty))
-}

treeLevel :: Int -> a -> BTree a

{-
    Write a function

      gatherOdd :: BTree Int -> [Int]

    such that given (gatherOdd tr), we return a list of all the odd integer
    labels within the tree.

    For example, (gatherOdd tree2) will return [13].
-}

gatherOdd :: BTree Int -> [Int]

{-
    Write a function

      tinkerTree :: (Int -> Int) -> (Int -> Int) -> BTree Int

    such that (tinkerTree f g tr) returns a new tree where each node with an
    even valued label has f applied to it, and each node with an odd labeled
    value has g applied to it.

    For example, (tinkerTree (+2) (*3) tree2) will return:
        BNode 10 (BNode 39 Empty
                          (BNode 14 Empty Empty))
                 (BNode 22 Empty Empty)
-}

tinkerTree :: (Int -> Int) -> (Int -> Int) -> BTree Int -> BTree Int

--------------------------------------------------------------------------------
-- List Recursion
--------------------------------------------------------------------------------

{-
    Write a recursive function

      myFilter :: (a -> Bool) -> [a] -> [a]

    such that (myFilter f xs) returns a list of values in xs which satisfy a
    condition as defined by f.

    For example, (myFilter odd [1,2,3,4,5]) will return [1,3,5].
 -}

myFilter :: (a -> Bool) -> [a] -> [a]

{-
    Write a function

      merge :: [Int] -> [Int] -> [Int]

    such that given (merge xs ys), where xs and ys are lists given in increasing
    order, we return a merged list of integers in increasing order.

    For example, (merge [1,3,5] [1,2,3,4,5]) will return [1,1,2,3,3,4,5,5].
 -}

merge :: [Int] -> [Int] -> [Int]

--------------------------------------------------------------------------------
-- Higher Order Functions/Anonymous Functions
--
-- NB: For extra practice, you can do some of the Schedule problems using
--       higher order functions.
--------------------------------------------------------------------------------

{-
    Write a function

      applyTake :: (a -> b) -> (b -> Bool) -> [a] -> [b]

    such that (applyTake f g xs) applies f to every value in the list xs, then
    returns only those values in the new list which satisfy g.

    For example, (applyTake (+1) odd [1,2,3,4,5]) returns [3,5].
 -}

applyTake :: (a -> b) -> (b -> Bool) -> [a] -> [b]
{-
     Consider the following Haskell function:

       believe :: Int -> [Int] -> [Int]
       believe x ys = [x + y | y <- ys, x < y+5]

     Using higher order functions, write an equivalent function.
 -}

believe, believe' :: Int -> [Int] -> [Int]
believe x ys = [x + y | y <- ys, x < y+5]

believe' x ys = fixMe

{-
     Using higher order functions, write a function

       factorPairs :: Int -> [Int] -> [Int] -> Bool

     such that (factorPairs n xs ys) checks to see if, for an element at index i
     in xs, when multliplied by the i-th element in ys, returns n for all i
     elements.

     For example, (factorPairs 25 [1,2,5,25] [25,3,5,1]) returns False
                  (factorPairs 25 [1,5,25] [25,5,1]) returns True
  -}

factorPairs :: Int -> [Int] -> [Int] -> Bool

--------------------------------------------------------------------------------
-- Potpourri!
--------------------------------------------------------------------------------

{-------------------------------------------------------------------------------
 - Suppose that the following definitions are made:
 ------------------------------------------------------------------------------}

data Airline = Jetblue | Delta | American | United | Southwest
  deriving (Show)

data Status = Ontime | Boarding Int | Taxiing | Delayed Int | Cancelled
  deriving (Show)

data Flight = Fl Airline Int Status
  deriving (Show)

f :: Int -> (String -> Bool) -> ((Char, Bool), String) -> Bool
f a b (('f', d), e)  = False
f a b ((c, d), e)    = (odd ((length e) + a)) || ((b e) && d)

g :: Int -> Bool
g x = x + 20 > 50

getSatisfaction :: Flight -> Int
getSatisfaction (Fl _ _ (Boarding _)) = 75
getSatisfaction (Fl _ _ (Delayed n))  = 100 - n
getSatisfaction (Fl _ _ Cancelled)    = 0        -- can't get no...
getSatisfaction (Fl _ _ _)            = 100

headify :: (a -> b) -> [a] -> b
headify f (x:xs) = f x

swapply :: (a -> b) -> (c -> d) -> (a, c) -> (d, b)
swapply f g (x,y) = (g y, f x)

dropkick :: (a -> Bool) -> (a -> Bool) -> [a] -> [a]
dropkick f g xs = dropWhile g (filter f xs)

superneg :: ([Bool], [Int]) -> [(Int,Bool)]
superneg (xs,ys) = zip (map (*(-1)) ys) (map not xs)

{-------------------------------------------------------------------------------
 - Give the values of the following expressions.
 ------------------------------------------------------------------------------}

-- v1 = dropkick (\x -> mod x 4 /= 0) odd [3,6..15]

-- v2 = headify (*8) [1,2]

-- v3 = unzip [("hello", 'w'), ("goodbye", 'y')]

-- v4 = superneg (unzip [(True, 7), (False, (-3))])

-- v5 = filter g [10,20..50]

-- v6 = map g [10,20..50]

-- v7 = swapply (\x -> 7*x) (\y -> 2 * y) (1,2)

-- v8 = getSatisfaction (Fl Jetblue 3 Cancelled)

-- v9 = (\(x,y) -> x + y) (3,6)

-- v10 = concatMap (\x -> [x,'a']) "tuba"

{-------------------------------------------------------------------------------
 - For each of the following expressions, give the most general type (i.e.,
 -   what Ghci would deduce) or explain why it has no type (i.e., why Ghci
 -   would complain of a type error):
 -
 -   1) headify fst
 -
 -   2) f 5
 -
 -   3) Fl Jetblue 315
 -
 -   4) zipWith (*)
 -
 -   5) zipWith (\x -> x+2)
 -
 -   6) dropWhile True [1,2,3,4,5]
 -
 -   7) swapply (\x -> x + 5) (\y -> 7)
 -
 -   8) snd (swapply (\x -> x + 5) (\y -> 7) (3,5))
 -
 -   9) zip [1,3,5,7,9] ["two", "four", "six", "eight", "ten"]
 -
 -   10) dropkick odd
 -
 -   11) zipWith g
 ------------------------------------------------------------------------------}
