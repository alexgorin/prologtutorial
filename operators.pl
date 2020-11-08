/**
prop  ->  p
prop  ->  q
prop  ->  r
prop  -> ¬  prop
prop  -> (prop   ∧  prop)
prop  -> (prop   ∨  prop)
prop  -> (prop   →  prop)
*/


:-  op(610,  yfx,  [and]).
:-  op(620,  yfx,  [or]).
:-  op(630,  fx,  [not]).
:-  op(640,  yfx,  implies).
