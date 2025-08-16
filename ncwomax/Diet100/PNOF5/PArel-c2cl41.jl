using DoNOF

mol = """
1 1
C     0.6667106    0.0000000    0.3702088 
C    -0.6667106    0.0000000    0.3702088 
Cl    1.6541389    0.0000000    1.7151679 
Cl    1.4734245    0.0000000   -1.2029026 
Cl   -1.6541389    0.0000000    1.7151679 
Cl   -1.4734245    0.0000000   -1.2029026 
H     0.0000000    0.0000000   -1.7649483 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PArel-c2cl41"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
