using DoNOF

mol = """
0 1
 C                  0.47920200    1.40982000    0.00000000
 N                  0.14499800    0.14732800    0.00000000
 H                  0.44233900    1.89494300    0.95814800
 H                  0.44233900    1.89494300   -0.95814800
 F                  0.47920200   -0.56755000   -1.10365500
 F                 -1.48894700   -0.34046800    0.00000000
 F                  0.47920200   -0.56755000    1.10365500
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "YBDE18-nf3-ch2"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
