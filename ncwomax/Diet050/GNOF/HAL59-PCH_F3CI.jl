using DoNOF

mol = """
0 1
   P     0.000000    0.000000   -3.628273
   C     0.000000    0.000000   -5.152747
   H     0.000000    0.000000   -6.224379
   I     0.000000    0.000000    0.095628
   C     0.000000    0.000000    2.236336
   F     0.000000    1.244253    2.706617
   F    -1.077555   -0.622126    2.706617
   F     1.077555   -0.622126    2.706617
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-PCH_F3CI"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
