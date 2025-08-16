using DoNOF

mol = """
0 1
 S                  0.00000000    0.00000000    0.55663400
 F                  0.00000000    1.21282100   -0.49478600
 F                  0.00000000   -1.21282100   -0.49478600
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "YBDE18-f2s"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
