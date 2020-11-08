/**
prop  ->  p
prop  ->  q
prop  ->  r
prop  -> ¬  prop
prop  -> (prop   ∧  prop)
prop  -> (prop   ∨  prop)
prop  -> (prop   →  prop)
*/

s --> [p].
s --> [q].
s --> [r].
s --> not,s.
s --> lb,s,and,s,rb.
s --> lb,s,or,s,rb.
s --> lb,s,implies,s,rb.
not --> [not].
lb --> ['('].
rb --> [')'].
and --> [and].
or --> [or].
implies --> [implies].
