using DoNOF

mol = """
0 1
 N                  0.00000000    0.00000000    0.11361500
 H                  0.00000000    0.93799100   -0.26510100
 H                 -0.81232400   -0.46899600   -0.26510100
 H                  0.81232400   -0.46899600   -0.26510100
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "YBDE18-nh3"

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
