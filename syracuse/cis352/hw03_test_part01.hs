
test_isNotNNF = [ T, F, (Var "X"), 
                 ((Var "P" :|: Not (Var "Q")) :&: Var "R"),
                 (((Var "P") :|: (Var "Q")) :&: ((Not (Var "P")) :&: (Not (Var "Q")))) ]

test_isNNF    = [ ((Var "P") :->: (Var "Q")),
                  (Not (Not (Var "R"))),
                  (Not (Var "P" :&: Var "Q")) ]

check_isNotNNF = and [isNNF x == False | x <- test_isNotNNF]
check_isNNF = and [isNNF x == True | x <- test_isNNF]
check_allNNF = check_isNNF && check_isNotNNF


main = do putStr"    isNNF/toNNF (nnf1_prop): "
          quickCheck (within 5000000 nnf1_prop)
          putStr"    isNNF/toNNF (nnf2_prop): "
          quickCheck (within 5000000 nnf2_prop)
          putstr"     isNNF (check_isNotNNF): "
          putstr"          isNNF (check_isNotNNF): "
          putstr"             isNNF (check_isNNF): "
          putStr" isTidy/toTidy (tidy1_prop): "
          quickCheck (within 5000000 tidy1_prop)
          putStr" isTidy/toTidy (tidy2_prop): "
          quickCheck (within 5000000 tidy2_prop)

