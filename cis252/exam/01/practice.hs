{----------------------------------------------------------------------------------
 - Practice Problems for CIS 252: Exam 1
 - Version 2
 -
 - Written by Terence Nip
 -
 - Protip: You can load this file into GHCI and run the questions to see if
 -    you got them right!
 ---------------------------------------------------------------------------------}


{----------------------------------------------------------------------------------
 - Nitpicky/Function Problems
 ---------------------------------------------------------------------------------}

-- What is the difference between div and / ?

np1 = div 5 2
np2 = 5 / 2

-- What do the following return?

np3 = length [1,3,5,7,9]
np4 = sum [1,3,5,7,9]
np5 = product [1,2,3,5,10]
np6 = reverse [1,2,3,5,10]

{----------------------------------------------------------------------------------
 - Tuple Problems
 -
 - What do the following expressions evaluate to?
 ---------------------------------------------------------------------------------}

tu1 = fst ([1,3], True)

tu2 = snd ([1,3], True)

tu3 = snd (head [(1,True), (5, False), (9, True)])

tu4 = [x | (x, y) <- [(1,True), (4, False), (9, False), (10, True)]]

tu5 = [x | (x, y) <- [(1,True), (4, False), (9, False), (10, True)], even x]

tu6 = [x | (x, y) <- [(1,True), (4, False), (9, False), (10, True)], even x, y == True]

tu7 = [x | (x, y) <- [(1,True), (4, False), (9, False), (10, True)], even x, y]

tu8 = [x | (x, y) <- [(1,True), (4, False), (9, False), (10, True)], odd x, not y]

tu9 = [y | (x, y) <- [(1,True), (4, False), (9, False), (10, True)], x >= 2]

tu10 = [(y, x) | (x, y) <- [(1,True), (4, False), (9, False), (10, True)]]

{----------------------------------------------------------------------------------
 - ++, (:), concat Questions
 -
 - What do the following expressions evaluate to?
 ---------------------------------------------------------------------------------}

c1 = concat [[1,3], [5,7], [9,11,13,15]]

c2 = 1:[3,5]

c3 = [1,3] ++ [5,7]

c4 = concat ['b' : ['e', 'g'] ++ ['h', 'i'], "mom"]

c5 = 1 : concat [[3,5], [7, (3+8)], 9:[4,8,13]] ++ (10:[17, 13] ++ [5,9])

{----------------------------------------------------------------------------------
 - List Comprehension Questions
 -
 - Write a list comprehension using the form [ _______ | x <- [1 .. 10] _______ ]
 ---------------------------------------------------------------------------------}

-- [61, 62, 63, 64, 65, 66, 67, 68, 69, 70]


-- [61,63,65,67,69]


-- [65]


-- [[1],[3],[5],[7],[9]]


-- [(200,300),(400,500),(600,700),(800,900),(1000,1100)]


-- [[4],[4,5],[4,5,6],[4,5,6,7],[4,5,6,7,8]]


-- [[400],[400,500],[400,500,600],[400,500,600,700],[400,500,600,700,800]]


-- [(3,True),(6,False),(9,True),(12,False),(15,True),(18,False)]


{----------------------------------------------------------------------------------
 - Type Questions
 - 
 - What are the types and values of the following expressions?
 ---------------------------------------------------------------------------------}

foo :: [Int] -> Bool
foo xs = length [x | x <- xs, odd x] > 2

bar :: [[Int]] -> [[Int]]
bar []    = [[5]]
bar [[x]] = [[3]]
bar xs    = [head xs]

t1 = (1, True)

t2 = [x | x <- "abcd"]

t3 = fst ( [a | (a, b) <- [('1', "b"), ('2', "c")]], 5)

t4 = 3: [5,7] ++ []

t5 = foo [1, 5, 14]

t6 = [[1,3], [5]] ++ [[7]]

t7 = ("c", ( [x | x <- ['1', '3', '5']] : [], bar [[1,5], [3]]))

t8 = 20

t9 = "20" ++ "40"

t10 = 20 + 40

t11 = concat [['1', '3'], ['5']]

t12 = fst (not (foo []), "Josiah")

{----------------------------------------------------------------------------------
 - Word Problems
 ---------------------------------------------------------------------------------}

{-
 - Write a Haskell function
 -    divisibleBy :: [Int] -> Int -> [Bool]
 - such that divisibleBy xs y returns a list of boolean values corresponding to whether or not a number in the list xs is divisible by y. If y is 0, you should return an error saying that you cannot divide by zero.
 -
 - For example: 
 -    divisibleBy [2,3,4,5,6] 2 returns [True, False, True, False, True]
 -    divisibleBy [0] 2 returns [True]
 -    divisibleBy [2,3] 0 returns an error.
 -}





{-
 - Write a Haskell function
 -    onLine :: (Int, Int) -> (Int, Int) -> [Char]
 - such that onLine (x1, y1) (x2 y2) determines whether or not the two points are on the same axes. If x1 equals x2, return "Same X". If y1 equals y2, return "Same Y". If the two points are the same, return "Same point". Otherwise, return "Not on line."
 -
 - For example:
 -    onLine (0, 0) (0, 5) returns "Same X"
 -    onLine (0, 0) (1, 0) returns "Same Y"
 -    onLine (0, 0) (0, 0) returns "Same point"
 -    onLine (0, 0) (1, 1) returns "Not on line"
 -}





{-
 - Write a Haskell function 
 -    factorial :: Int -> Int
 - such that factorial x returns the factorial of x. Note that (factorial 0) is 1, (factorial 1) is 1, and (factorial x) is the product of the current number (i.e., x) and the previous numbers.
 -
 - For example:
 -    factorial 0 returns 1
 -    factorial 1 returns 1
 -    factorial 5 returns 120
 -}
