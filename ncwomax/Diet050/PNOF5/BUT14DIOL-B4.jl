using DoNOF

mol = """
0 1
 C -1.438928 -0.109815 0.532071
 H -2.472335 0.074573 0.824884
 O -1.472527 -1.083552 -0.502451
 C -0.798219 1.204086 0.087042
 H -1.457038 1.694153 -0.632207
 H -0.730959 1.861206 0.959896
 C 0.591628 1.056143 -0.543803
 H 1.012608 2.052465 -0.699924
 H 0.503531 0.596227 -1.530477
 H -0.586097 -1.462372 -0.503945
 H -0.916779 -0.505724 1.408012
 C 1.580711 0.238084 0.281688
 H 2.606138 0.472048 -0.011136
 H 1.48113 0.469273 1.342522
 O 1.360717 -1.179607 0.166189
 H 1.843127 -1.477562 -0.609527
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BUT14DIOL-B4"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
