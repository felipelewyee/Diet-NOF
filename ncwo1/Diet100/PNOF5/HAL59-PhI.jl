using DoNOF

mol = """
0 1
   I     0.000000    0.000000    1.542040
   C     0.000000    0.000000   -0.553004
   C     0.000000    1.205567   -1.238203
   C     0.000000    1.199115   -2.625424
   C     0.000000    0.000000   -3.320969
   C     0.000000   -1.199115   -2.625424
   C     0.000000   -1.205567   -1.238203
   H     0.000000    2.142377   -0.697547
   H     0.000000    2.139678   -3.161229
   H     0.000000    0.000000   -4.403195
   H     0.000000   -2.139678   -3.161229
   H     0.000000   -2.142377   -0.697547
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-PhI"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
