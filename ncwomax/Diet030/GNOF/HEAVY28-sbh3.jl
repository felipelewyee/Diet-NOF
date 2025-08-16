using DoNOF

mol = """
0 1
   Sb         0.00000000      0.00000000      0.70962975
   H         -0.69522101      1.20415811     -0.23654319
   H         -0.69522101     -1.20415811     -0.23654319
   H          1.39044201      0.00000000     -0.23654319
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HEAVY28-sbh3"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
