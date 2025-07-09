using DoNOF

mol = """
0 1
   N     0.000000    0.000000    3.415281
   C     0.000000    0.000000    4.557070
   H     0.000000    0.000000    5.624831
   I     0.000000    0.000000    0.309915
   C     0.000000    0.000000   -1.826797
   F     0.000000    1.244435   -2.308849
   F     1.077712   -0.622217   -2.308849
   F    -1.077712   -0.622217   -2.308849
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-NCH_F3CI"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
