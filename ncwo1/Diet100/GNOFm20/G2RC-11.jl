using DoNOF

mol = """
0 1
   N          0.00000000      0.00000000      0.28518416
   H         -0.46974919      0.81362946     -0.09506139
   H         -0.46974919     -0.81362946     -0.09506139
   H          0.93949837      0.00000000     -0.09506139
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "G2RC-11"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
