using DoNOF

mol = """
0 2
   C          0.00000000      0.00000000      0.00000000
   H          0.53865812      0.93298323      0.00000000
   H          0.53865812     -0.93298323      0.00000000
   H         -1.07731624      0.00000000      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-ch3"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
