using DoNOF

mol = """
0 1
C    -0.7291026    0.1343493   -0.8031631 
Cl    0.3112218   -0.0204531   -2.1475547 
C     0.0163271    0.0188569    0.4618951 
H     1.1084337    0.0136953    0.4418168 
H    -0.3632198    0.7784759    1.1509269 
H    -0.3436601   -0.9249243    0.8960790 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CARBHB12-2N_B"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
