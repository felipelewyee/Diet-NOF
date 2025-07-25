using DoNOF

mol = """
0 1
N    -2.4871659    0.1746169   -0.1204509 
H    -1.4936065    0.1249013   -0.3221195 
H    -2.7954866    1.0883668   -0.4234370 
H    -2.9392636   -0.4917072   -0.7308413 
C     0.8901512   -0.0150136   -0.5370216 
Cl    1.9304756   -0.1698160   -1.8814132 
C     1.6355809   -0.1305061    0.7280366 
H     2.7276874   -0.1356677    0.7079582 
H     1.2560340    0.6291129    1.4170683 
H     1.2755937   -1.0742873    1.1622204 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CARBHB12-2N"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
