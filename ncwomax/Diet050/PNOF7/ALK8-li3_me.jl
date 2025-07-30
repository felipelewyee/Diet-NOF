using DoNOF

mol = """
0 1
C     0.0221521    0.9322105    0.0000000 
Li   -0.0846323   -3.6131345    0.0000000 
H    -0.9408839    1.4659113    0.0000000 
H     0.5339901    1.3618377   -0.8736898 
H     0.5339901    1.3618377    0.8736898 
Li    1.1637452   -0.7805582    0.0000000 
Li   -1.2283611   -0.7281045    0.0000000 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ALK8-li3_me"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
