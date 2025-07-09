using DoNOF

mol = """
0 1
   P     0.000000    0.000000    4.198438
   C     0.000000    0.000000    5.723559
   H     0.000000    0.000000    6.795243
   I     0.000000    0.000000    0.434814
   C     0.000000    0.000000   -1.660899
   C     0.000000    1.205543   -2.346244
   C     0.000000    1.199222   -3.733517
   C     0.000000    0.000000   -4.429003
   C     0.000000   -1.199222   -3.733517
   C     0.000000   -1.205543   -2.346244
   H     0.000000    2.142581   -1.805804
   H     0.000000    2.139722   -4.269458
   H     0.000000    0.000000   -5.511263
   H     0.000000   -2.139722   -4.269458
   H     0.000000   -2.142581   -1.805804
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-PCH_PhI"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
