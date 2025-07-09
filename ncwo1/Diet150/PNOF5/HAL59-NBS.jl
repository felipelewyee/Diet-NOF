using DoNOF

mol = """
0 1
   Br    0.000000    0.000000    1.633398
   C     0.000000    1.156349   -0.969567
   N     0.000000    0.000000   -0.185628
   O     0.000000    2.284598   -0.572597
   O     0.000000   -2.284598   -0.572597
   C     0.000000   -1.156349   -0.969567
   C     0.000000   -0.661924   -2.386321
   C     0.000000    0.661924   -2.386321
   H     0.000000    1.348248   -3.218669
   H     0.000000   -1.348248   -3.218669
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-NBS"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
