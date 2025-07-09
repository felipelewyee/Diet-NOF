using DoNOF

mol = """
0 1
   H          0.62927710      0.62927710     -0.62927710
   C          0.00000000      0.00000000      0.00000000
   H         -0.62927710     -0.62927710     -0.62927710
   H          0.62927710     -0.62927710      0.62927710
   H         -0.62927710      0.62927710      0.62927710
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RSE43-E1"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
