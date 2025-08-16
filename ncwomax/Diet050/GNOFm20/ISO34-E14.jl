using DoNOF

mol = """
0 1
   C          0.00000000      0.00000000      0.48865291
   C          0.00000000      0.00000000     -0.96688364
   N          0.00000000      0.00000000     -2.11787974
   H          0.51196226     -0.88674465      0.86537016
   H          0.51196226      0.88674465      0.86537016
   H         -1.02392452      0.00000000      0.86537016
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ISO34-E14"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
