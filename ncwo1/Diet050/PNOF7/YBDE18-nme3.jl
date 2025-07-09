using DoNOF

mol = """
0 1
 N                  0.00000000    0.00000000    0.40681100
 C                  0.00000000    1.37311100   -0.06554000
 H                  0.00000000    1.43156400   -1.16702500
 H                 -0.88452100    1.88977300    0.30551800
 H                  0.88452100    1.88977300    0.30551800
 C                 -1.18914900   -0.68655500   -0.06554000
 H                 -1.23977100   -0.71578200   -1.16702500
 H                 -1.19433100   -1.71090400    0.30551800
 H                 -2.07885100   -0.17886900    0.30551800
 C                  1.18914900   -0.68655500   -0.06554000
 H                  1.23977100   -0.71578200   -1.16702500
 H                  2.07885100   -0.17886900    0.30551800
 H                  1.19433100   -1.71090400    0.30551800
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "YBDE18-nme3"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
