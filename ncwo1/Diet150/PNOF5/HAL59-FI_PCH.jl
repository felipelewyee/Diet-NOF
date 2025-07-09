using DoNOF

mol = """
0 1
   F     0.000000    0.000000    2.693559
   I     0.000000    0.000000    0.765094
   P     0.000000    0.000000   -2.412384
   C     0.000000    0.000000   -3.933518
   H     0.000000    0.000000   -5.005149
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-FI_PCH"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
