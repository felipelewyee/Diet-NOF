using DoNOF

mol = """
0 1
   O          0.00000000      0.00000000      0.39219533
   H         -0.75610000      0.00000000     -0.19609767
   H          0.75610000      0.00000000     -0.19609767
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HEAVY28-h2o"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
