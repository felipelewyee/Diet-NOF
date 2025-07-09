using DoNOF

mol = """
0 1
C    -1.2045878    0.6954665    0.0000000 
C    -1.2045878   -0.6954666    0.0000000 
C    -0.0000000   -1.3909631    0.0000000 
C     1.2045879   -0.6954665    0.0000000 
C     1.2045880    0.6954665    0.0000000 
C    -0.0000000    1.3909631    0.0000000 
Cl   -2.6827211   -1.5488874    0.0000000 
Cl   -0.0000000   -3.0976517    0.0000000 
Cl    2.6827211   -1.5488876    0.0000000 
Cl    2.6827212    1.5488875    0.0000000 
Cl   -0.0000003    3.0976517    0.0000000 
Cl   -2.6827210    1.5488875    0.0000000 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DC13-C6Cl6"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
