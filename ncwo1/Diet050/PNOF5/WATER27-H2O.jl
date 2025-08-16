using DoNOF

mol = """
0 1
O     0.0000000    0.0000000   -0.3893611 
H     0.7629844    0.0000000    0.1946806 
H    -0.7629844    0.0000000    0.1946806 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WATER27-H2O"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
