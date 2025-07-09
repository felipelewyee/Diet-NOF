using DoNOF

mol = """
0 1
   I     0.000000    0.000000    0.325262
   C     0.000000    0.000000   -1.803245
   H     0.000000    1.030196   -2.139797
   H    -0.892176   -0.515098   -2.139797
   H     0.892176   -0.515098   -2.139797
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-MeI"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
