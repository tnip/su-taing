

tnip_squash_prop xs = (squash (+) ys == squash' (+) ys)
  where ys = map (`mod` 1000) xs

main = do putStr "    same: "
          if (same [1,2,1] == False) &&
             (same [1,1,1] == True) && 
             (same [1,2] == False) &&
             (same [1,1] == True) && 
             (same [] == True)
          then putStrLn "True"
          else putStrLn "False"
          putStr "pipeline: "
          if (pipeline [(+1),(*2),pred] [1,2,3,4,5] == [1,3,5,7,9]) &&
             (pipeline [(+1), (*2), pred] [] == []) &&
             (pipeline [] [1,2,3,4,5] == [1,2,3,4,5]) &&
             (pipeline [id] [1,2,3,4,5] == [1,2,3,4,5])
          then putStrLn "True"
          else putStrLn "False"

