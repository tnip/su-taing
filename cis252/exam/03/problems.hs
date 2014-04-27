{--------------------------------------------------------------------------
 -- Exam 3 Practice Questions: v1.1
 --
 -- NB: These questions may be either harder or easier than those you
 --         may see on your exam - this is meant to serve as additional
 --         practice material in case Dr. Older's questions have not
 --         whetted your appetite. ;-)
 --
 -- Remember that this exam covers a slew of things, includiong:
 -l-        * Higher-Order Functions
 --         * Algebraic Data Types
 --         * Turing Machines
 --         * Unix commands from Lab 10 (and by extension Lab 1)
 --
 -- As such, it may behoove you to recall what these all are prior to
 --         doing practice material.
 -------------------------------------------------------------------------}


{--------------------------------------------------------------------------
 -- Unix Command Questions
 --
 -- For these questions, do not look up the commands.
 --------------------------------------------------------------------------
 -- 
 -- Suppose the file notes.txt in the current directory has the following
 --     contents:
 --
 --     This little piggy went to the market
 --     This little piggy stayed home
 --     This little piggy had roast beef
 --     This little piggy had none
 --     And this little piggy cried wee wee wee all the way home
 --
 -- Also suppose that the file vertigo.txt in the current directory has the
 --     following contents:
 --
 --     uno
 --     dos
 --     tres
 --     catorce
 --     dos
 --     donde esta
 --     catorce
 --     uno
 --
 -- (1) Give a one-line Unix command that would generate the following
 --     output:
 --
 --     And this little piggy cried wee wee wee all the way home
 --
 --
 -- (2) Give a one-line Unix command that would generate the following
 --     output: 
 --
 --     And this little piggy cried wee wee wee all the way home
 --     This little piggy had none
 --     This little piggy had roast beef
 --     This little piggy stayed home
 --     This little piggy went to the market
 --
 --
 -- (3) Give a one line Unix command that would generate the following
 --     output: 
 --
 --     catorce
 --     donde esta
 --     dos
 --     tres
 --     uno
 --
 --
 -- (4) Give a one line Unix command that would generate the line count
 --     of the file "vertigo.txt" and store it in "vertigowc.txt".
 --
 --
 -- (5) Recall that the dictionary lives in /usr/dict/words. 
 --
 --     (a) Find all the dictionary words starting with "ll" that are 
 --         five characters long. For example, "llama" would satisfy
 --         those requirements.
 --
 --
 --     (b) Find all the dictionary words that do not contain "aa".
 --         For example, "assbaa" would not satisfy that requirement
 --         but "awesome" would.
 --
 --
 --     (c) Find all the dictionary words that start with an a,
 --         followed by any three characters, then a d, and end
 --         with an a. For example, "amygdala" and "anhedonia" 
 --         would satisfy that requirement.
 --
 -------------------------------------------------------------------------}
 
{--------------------------------------------------------------------------
 -- Output Redirection Questions
 --
 -- For these questions, do not look up the commands.
 --------------------------------------------------------------------------
 --
 -- Suppose Jose's home directory contains four sub-directories with the
 --     following contents:
 --
 -- cis252
 --     contains the files: scratch.hs scratch.trans
 --     contains the folders: hw lab grades
 --
 -- cis400
 --     contains the files: practical.ccs practical.gctl
 --     contains the folders: hw
 --
 -- misc
 --     contains the files: answers.txt
 --     contains the folders: cats
 --
 -- (1) Get a "long" listing (i.e., extra information about file
 --     permissions, etc.) for the folder "grades" in the cis252 directory,
 --     and save the results of that as "cis252-grades" in Jose's misc
 --     directory.
 --
 --
 -- (2) Get a "long" listing for the folder "hw" in the cis400 directory,
 --     then obtain the word count for it and save it as "cis400-hw" in 
 --     the cis400 directory.
 --
 -------------------------------------------------------------------------}

{--------------------------------------------------------------------------
 -- Turing Machine Questions
 -- 
 -- NB: You will need a copy of Turing.hs, which you can get here:
 --             http://www.cis.syr.edu/~sueo/cis252/code/Turing.hs
 --------------------------------------------------------------------------}

import Turing

{--------------------------------------------------------------------------
 -- Question 1
 --------------------------------------------------------------------------
 -- Consider the Turing machine as given below (written in the Haskell
 -- format from class and the homeworks). 
 --
 -- (a) Assume that the initial tape contains the string "aaaa#aaa" and the
 --     tape head starts on the leftmost symbol of the string. What is the
 --     string that appears on the final tape?
 --
 -- (b) Assume that the initial tape contains the string "aaa#aaa" and the
 --     tape head starts on the leftmost symbol of the string. What is the
 --     string that appears on the final tape?
 --------------------------------------------------------------------------}

anotherTM :: Prog
anotherTM = [
                    (("A", 'a'), (' ', Rght, "B")),
                    (("A", '#'), (' ', Rght, "E")),
                    (("B", 'a'), ('a', Rght, "B")),
                    (("B", '#'), ('#', Rght, "B")),
                    (("B", ' '), (' ', Lft, "C")),
                    (("C", 'a'), (' ', Lft, "D")),
                    (("C", '#'), (' ', Lft, "F")),
                    (("D", 'a'), ('a', Lft, "D")),
                    (("D", '#'), ('#', Lft, "D")),
                    (("D", ' '), (' ', Rght, "A")),
                    (("E", 'a'), (' ', Rght, "E")),
                    (("E", ' '), ('1', Lft, "A")),
                    (("F", 'a'), (' ', Lft, "F")),
                    (("F", ' '), ('0', Rght, "A"))
                ]


{--------------------------------------------------------------------------
 -- Question 2
 --------------------------------------------------------------------------
 -- Write a Turing Machine to record the number of m's in a string
 -- containing m's, n's and p's. The string may be empty. You should
 -- assume that the tape head begins at the leftmost symbol on the input
 -- tape.
 --
 -- The final answer should appear as a unary string; that is, for every m
 -- found in the original string, a 1 should exist in the final string.
 --
 -- For example, if the original input string is "mnpmmmm", the final
 -- string should be "11111". If the original input string is "np", the
 -- final string should be "".
 --
 -- (You can either write a program or draw a state transition diagram.)
 --------------------------------------------------------------------------}


{--------------------------------------------------------------------------
 -- Question 3
 --------------------------------------------------------------------------
 -- Write a Turing Machine to replace every instance of "ab" in a string 
 -- containing a's, b's, and c's to "ac". The string may be empty. You
 -- should assume that the tape begins at the leftmost symbol on the input
 -- tape.
 -- 
 -- For example, if the original input string is "abcabc", the final
 -- string should be "accacc". If the original input string is "bca", the
 -- final string should be "bca".
 --
 -- (You can either write a program or draw a state transition diagram.)
 --------------------------------------------------------------------------}

{--------------------------------------------------------------------------
 -- Types and Things!
 --
 -- Suppose the following definitions are made:
 --------------------------------------------------------------------------}

data Glee = Wonder Char Int (Bool, Int)
          | Enjoy Int Glee
          | Joy (Bool, Int, Float)

joy :: Bool -> (Int -> Bool)
joy True = (\x -> odd x)
joy False = (\x -> mod (x*2) 3 == 0)

miracle :: Glee -> Bool
miracle (Wonder x y (z, a)) = y == 9
miracle (Enjoy x y)         = even x
miracle (Joy (x, y, z))     = mod 17 y == 5

fun :: Int -> Bool -> Glee
fun 5 b = Wonder 's' 10 (b, 0)
fun n b = Wonder 'c' n (b, n * 2)

{--------------------------------------------------------------------------
 -- For each of the following expressions, give its type.
 -- (For example, the type of [False] is [Bool].)
 --------------------------------------------------------------------------}
 
ta = Wonder 'c'

tb = filter (flip joy 5)

tc = joy (miracle (Joy (True, 5, 32))) 6

td = map (fun 5)

te = (map, Joy, False)
