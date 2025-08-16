using DoNOF

mol = """
0 1
P     0.0000000    0.4181339    0.0000000 
F    -0.8645858    1.8133865    0.0000000 
H    -0.7353678   -0.2200679    1.0319267 
H    -0.7353678   -0.2200679   -1.0319267 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PNICO23-17b"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
