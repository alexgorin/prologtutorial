/**
a^n b^2m c^2m d^n
*/

s --> [].
s --> s_bc.
s --> l,s,r.
s_bc --> [].
s_bc --> l_bc,l_bc,s_bc,r_bc,r_bc.
l --> [a].
r --> [d].
l_bc --> [b].
r_bc --> [c].
