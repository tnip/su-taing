
tnsquash_pred xs = (squash (+) ys == squash' (+) ys)
  where ys = map (`mod` 1000) xs

main = do 
          putStr(" (5)      Same: ")
          if (same [0,1,2] == False) &&
             (same [9, 9, 9] == True) && 
             (same [] == True)
          then putStr("True") else putStr("False")

          putStr(" (6) Squash QC: ")
          quickCheck tnsquash_pred
          
          putStr(" (6a)   Squash: ")
          if (squash (+) [0,1,2] == [1,3]) &&
             (squash (*) [1,2,3] == [2,6])
          then putStr("True") else putStr("False")

          putStr(" (6b)   Squash: ")
          if (squash' (+) [0,1,2] == [1,3]) &&
             (squash' (*) [1,2,3] == [2,6])
          then putStr("True") else putStr("False")

          putStr("  (7) Pipeline: ")
          if (pipeline [(+1),(*2),pred] [1,2,3,4,5] == [1,3,5,7,9]) &&
             (pipeline [(+1), (*2), pred] [] == []) &&
             (pipeline [] [1,2,3,4,5] == [1,2,3,4,5])
          then putStr("True") else putStr("False")

