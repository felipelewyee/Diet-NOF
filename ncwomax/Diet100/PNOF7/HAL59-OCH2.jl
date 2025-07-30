using DoNOF

mol = """
0 1
   O     0.000000    0.000000    0.671599
   C     0.000000    0.000000   -0.526142
   H     0.000000    0.938969   -1.107971
   H     0.000000   -0.938969   -1.107971
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-OCH2"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
