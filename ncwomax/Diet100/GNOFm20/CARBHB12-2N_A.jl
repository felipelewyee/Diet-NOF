using DoNOF

mol = """
0 1
N    -0.0000000    0.0000000    0.2864269 
H    -0.4695853    0.8133456   -0.0954756 
H    -0.4695853   -0.8133456   -0.0954756 
H     0.9391706    0.0000000   -0.0954756 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CARBHB12-2N_A"

p.ipnof = 8
p.ista = 1
p.h_cut = 0.02 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
