using DoNOF

mol = """
0 1
 P                  0.00000000    0.00000000    0.50533800
 F                  0.00000000    1.37292000   -0.28074300
 F                 -1.18898400   -0.68646000   -0.28074300
 F                  1.18898400   -0.68646000   -0.28074300
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "YBDE18-pf3"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
