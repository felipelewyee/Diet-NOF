using DoNOF

mol = """
0 1
Al   -0.0000000    0.0000000    0.0000000 
H    -0.7926514    1.3729124    0.0000000 
H    -0.7926514   -1.3729124    0.0000000 
H     1.5853027    0.0000000    0.0000000 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "MB16-43-AlH3"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
