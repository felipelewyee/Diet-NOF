using DoNOF

mol = """
0 1
Mg    0.0000000    0.0000000    0.0000000 
H    -0.0000000   -0.0000000   -1.7069341 
H    -0.0000000    0.0000000    1.7069341 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "MB16-43-MgH2"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
