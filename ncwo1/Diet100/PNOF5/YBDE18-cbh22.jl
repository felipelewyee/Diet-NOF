using DoNOF

mol = """
0 1
 C                  0.00000000    0.00000000    0.00000000
 B                  0.00000000    0.00000000    1.43043000
 B                  0.00000000    0.00000000   -1.43043000
 H                  0.00000000    1.04834700    1.99345500
 H                  0.00000000   -1.04834700    1.99345500
 H                  0.00000000    1.04834700   -1.99345500
 H                  0.00000000   -1.04834700   -1.99345500 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "YBDE18-cbh22"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
