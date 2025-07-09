using DoNOF

mol = """
0 1
C     0.00000    0.00000    0.00000
B     0.00000    0.00000    1.43043
B     0.00000    0.00000   -1.43043
H     0.00000    1.04835    1.99345
H     0.00000   -1.04835    1.99345
H     0.00000    1.04835   -1.99345
H     0.00000   -1.04835   -1.99345
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "YBDE18-cbh22"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
