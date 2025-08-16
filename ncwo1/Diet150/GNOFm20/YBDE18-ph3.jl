using DoNOF

mol = """
0 1
 P                  0.00000000    0.00000000    0.12702600
 H                  0.00000000    1.18936500   -0.63513000
 H                 -1.03002000   -0.59468300   -0.63513000
 H                  1.03002000   -0.59468300   -0.63513000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "YBDE18-ph3"

p.ipnof = 8
p.ista = 1
p.h_cut = 0.02 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
