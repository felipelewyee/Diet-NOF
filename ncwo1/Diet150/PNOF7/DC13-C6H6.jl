using DoNOF

mol = """
0 1
C    -1.1988024    0.6921286    0.0000000 
C    -1.1988024   -0.6921286    0.0000000 
C     0.0000000   -1.3842539    0.0000000 
C     1.1988024   -0.6921286    0.0000000 
C     1.1988024    0.6921286    0.0000000 
C     0.0000000    1.3842539    0.0000000 
H    -2.1331549   -1.2315778    0.0000000 
H     0.0000000   -2.4631518    0.0000000 
H     2.1331549   -1.2315778    0.0000000 
H     2.1331549    1.2315778    0.0000000 
H     0.0000000    2.4631518    0.0000000 
H    -2.1331549    1.2315778    0.0000000 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DC13-C6H6"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
