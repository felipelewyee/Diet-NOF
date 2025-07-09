using DoNOF

mol = """
0 1
   C          0.00000000      1.97299308      0.00000000
   Al         0.00000000      0.00000008      0.00000000
   C          1.70866200     -0.98649592      0.00000000
   C         -1.70866200     -0.98649592      0.00000000
   H          0.99987200      2.40813108      0.00000000
   H         -0.53061900      2.36190408      0.87353400
   H         -0.53061900      2.36190408     -0.87353400
   H          2.31077900     -0.72142292     -0.87353400
   H          2.31077900     -0.72142292      0.87353400
   H          1.58556700     -2.06997992      0.00000000
   H         -2.58543900     -0.33815092      0.00000000
   H         -1.78016000     -1.64048192      0.87353400
   H         -1.78016000     -1.64048192     -0.87353400
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "AL2X6-alme3"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
