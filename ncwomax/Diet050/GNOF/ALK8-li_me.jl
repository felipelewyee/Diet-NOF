using DoNOF

mol = """
0 1
C    -0.0000000    0.0000000   -0.1355349 
Li    0.0000000    0.0000000    1.8389425 
H    -0.5035124    0.8721091   -0.5678726 
H    -0.5035124   -0.8721091   -0.5678726 
H     1.0070249    0.0000000   -0.5678726 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ALK8-li_me"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
