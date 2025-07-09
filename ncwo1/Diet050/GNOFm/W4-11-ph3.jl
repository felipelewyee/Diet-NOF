using DoNOF

mol = """
0 1
P        0.000000    0.000000    0.127408 
H        0.000000    1.190343   -0.637041 
H       -1.030867   -0.595172   -0.637041 
H        1.030867   -0.595172   -0.637041 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "W4-11-ph3"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
