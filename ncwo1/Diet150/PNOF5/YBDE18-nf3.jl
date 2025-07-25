using DoNOF

mol = """
0 1
 N                  0.00000000    0.00000000    0.48304300
 F                  0.00000000    1.22759200   -0.12523300
 F                 -1.06312600   -0.61379600   -0.12523300
 F                  1.06312600   -0.61379600   -0.12523300
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "YBDE18-nf3"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
