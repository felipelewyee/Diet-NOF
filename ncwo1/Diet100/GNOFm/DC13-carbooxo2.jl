using DoNOF

mol = """
0 1
O    -1.8507645    3.2056181    0.0000000 
C    -1.2533914    2.1709376    0.0000000 
C    -1.2139101    0.7146014    0.0000000 
C    -1.2139101   -0.7146014    0.0000000 
C    -1.2533914   -2.1709376    0.0000000 
O    -1.8507645   -3.2056181    0.0000000 
C    -0.0119079   -1.4085777    0.0000000 
C     1.2258181   -0.6939763    0.0000000 
C     2.5067828    0.0000000    0.0000000 
O     3.7015289    0.0000000    0.0000000 
C     1.2258181    0.6939763    0.0000000 
C    -0.0119079    1.4085777    0.0000000 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DC13-carbooxo2"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
