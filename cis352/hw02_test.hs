

main = do
  putStr("     bmaxDepth: ")
  if
    ((bmaxDepth Empty) == -1) &&
    ((bmaxDepth (Branch 'x' Empty Empty) == 0)) &&
    ((bmaxDepth t1) == 2)
  then putStr("True\n") else putStr("False\n")
  putStr("     mmaxDepth: ")
  if
    ((mmaxDepth (Node 'x' [])) == 0) &&
    ((mmaxDepth t2) == 2)
  then putStr("True\n") else putStr("False\n")
  putStr("        blevel: ")
  if
    ((blevel 0 t1) == "") &&
    ((blevel 1 t1) == "m") &&
    ((blevel 2 t1) == "tq") && 
    ((blevel 3 t1) == "amw") &&
    ((blevel 4 t1) == "")
  then putStr("True\n") else putStr("False\n")
  putStr("        mlevel: ")
  if
    ((mlevel 0 t2) == "") &&
    ((mlevel 1 t2) == "u") &&
    ((mlevel 2 t2) == "cqny") && 
    ((mlevel 3 t2) == "mgjz") &&
    ((mlevel 4 t2) == "")
  then putStr("True\n") else putStr("False\n")
  putStr("       postfix: ")
  if
    ((postfix t1) == "atmwqm")
  then putStr("True\n") else putStr("False\n")
  putStr("  bleaves_prop: ")
  quickCheck bleaves_prop
  putStr("  mleaves_prop: ")
  quickCheck mleaves_prop
  putStr("  postfix_prop: ")
  quickCheck postfix_prop
  putStr("    recon_prop: ")
  quickCheck recon_prop
  putStr(" makeTreesTest: ")
  if makeTreesTest then putStr("True\n") else putStr("False\n")

